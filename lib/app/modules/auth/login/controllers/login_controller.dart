import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wr_project/app/modules/auth/login/provider/login_provider.dart';

import '../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final LoginProvider loginProvider = LoginProvider();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxBool obsecureText = true.obs;
  final RxBool isFormValid = false.obs;
  final GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    emailC.addListener(validateForm);
    passC.addListener(validateForm);
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }

  void validateForm() {
    if (validateEmail(emailC.text) == null &&
        validatePassword(passC.text) == null) {
      isFormValid.value = true;
    } else {
      isFormValid.value = false;
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email Wajib Diisi';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return 'Masukkan Email yang Valid';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password Wajib Diisi';
    } else if (value.length < 6) {
      return 'Password harus berisi 8';
    }
    return null;
  }

  Future<void> login() async {
    try {
      isLoading(true);
      var response = await loginProvider.login(emailC.text, passC.text);

      if (response.statusCode == 201) {
        Map<String, dynamic> jsonData = response.body;

        var token = jsonData['data']['token'];
        await storage.write('token', token);

        var userJson = jsonData['data']['user'];
        await storage.write('user', jsonEncode(userJson));

        var ppuJson = jsonData['data']['user']['ppu'];
        await storage.write('ppu', jsonEncode(ppuJson));

        List<dynamic> menuJsonList = jsonData['data']['menus'];
        await storage.write('menuList', jsonEncode(menuJsonList));

        Get.offAllNamed(Routes.HOME);
      } else if (response.statusCode == 401) {
        showErrorDialog("Email Atau Password Salah");
      } else {
        var errorMessage = response.body["Message"] ?? "Unknown Error Occurred";
        showErrorDialog(errorMessage);
      }
    } catch (error) {
      if (error is GetHttpException) {
        showErrorDialog("Tidak Ada Koneksi Internet");
      } else {
        showErrorDialog("Server Error Segera Hubungi Admin");
      }
    } finally {
      isLoading(false);
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
