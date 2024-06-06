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
      return 'Email is required';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  Future<void> login() async {
    isLoading.value = true;
    try {
      await _loginProvider.login(emailC.text, passC.text);
    } catch (error) {
      _showDialog('Error', 'Wrong Email And Password');
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

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
