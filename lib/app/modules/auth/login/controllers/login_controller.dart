import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wr_project/app/modules/auth/login/provider/login_provider.dart';

import '../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final LoginProvider _loginProvider = LoginProvider();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxBool obsecureText = true.obs;
  final RxBool isFormValid = false.obs;

  final GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    emailC.addListener(updateFormValidity);
    passC.addListener(updateFormValidity);
  }

  @override
  void onClose() {
    emailC.removeListener(updateFormValidity);
    passC.removeListener(updateFormValidity);
    super.onClose();
  }

  void updateFormValidity() {
    isFormValid.value = emailC.text.isNotEmpty && passC.text.isNotEmpty;
  }

  Future<void> login() async {
    if (emailC.text.isEmpty || passC.text.isEmpty) {
      _showDialog('Perhatian', 'Isi Email & Password Terlebih dahulu');
      return;
    }

    if (!isValidEmail(emailC.text)) {
      _showDialog('Perhatian', 'Masukkan alamat email yang valid');
      return;
    }

    if (passC.text.length < 6) {
      _showDialog(
          'Perhatian', 'Password harus terdiri dari minimal 6 karakter');
      return;
    }

    try {
      var response = await _loginProvider.login(emailC.text, passC.text);
      if (response.statusCode == 201) {
        Map<String, dynamic> jsonData = response.body as Map<String, dynamic>;

        var token = jsonData['data']['token'];
        await storage.write('token', token);

        var userJson = jsonData['data']['user'];
        await storage.write('user', jsonEncode(userJson));

        var ppuJson = jsonData['data']['user']['ppu'];
        await storage.write('ppu', jsonEncode(ppuJson));

        print(ppuJson);
        print(userJson);

        List<dynamic> menuJsonList = jsonData['data']['menus'];
        await storage.write('menuList', jsonEncode(menuJsonList));

        Get.offAllNamed(Routes.HOME);
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occurred";
      }
    } catch (error) {
      _showDialog('Error', 'Wrong Email And Password');
    }
  }

  void _showDialog(String title, String message) {
    Get.dialog(
      SimpleDialog(
        title: Text(title),
        contentPadding: EdgeInsets.all(20),
        children: [Text(message)],
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
