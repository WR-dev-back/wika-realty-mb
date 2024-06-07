import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wr_project/app/modules/auth/login/provider/login_provider.dart';

class LoginController extends GetxController {
  final LoginProvider _loginProvider = LoginProvider();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxBool obsecureText = true.obs;
  final RxBool isFormValid = false.obs;

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
    isLoading.value = true;
    try {
      await _loginProvider.login(emailC.text, passC.text);
    } catch (error) {
      _showDialog('Error', 'Email Dan Password Salah');
    } finally {
      isLoading.value = false;
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

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
