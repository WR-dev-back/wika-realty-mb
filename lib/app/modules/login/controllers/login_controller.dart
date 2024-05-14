import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wr_project/app/model/body.dart';
import 'package:wr_project/app/routes/app_pages.dart';

import '../../../data/api.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  static const _keyMenuList = 'menuList';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var isFormValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Listen to changes in email and password fields
    emailC.addListener(updateFormValidity);
    passC.addListener(updateFormValidity);
  }

  @override
  void onClose() {
    // Dispose listeners when controller is closed
    emailC.removeListener(updateFormValidity);
    passC.removeListener(updateFormValidity);
    super.onClose();
  }

  void updateFormValidity() {
    // Update isFormValid based on the validity of email and password fields
    bool isValid = emailC.text.isNotEmpty && passC.text.isNotEmpty;
    isFormValid.value = isValid;
  }

  Future<void> login() async {
    if (emailC.text.isEmpty || passC.text.isEmpty) {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text('Perhatian'),
            contentPadding: EdgeInsets.all(20),
            children: [Text('Isi Email & Password Terlebih dahulu')],
          );
        },
      );
      return;
    }

    if (!isValidEmail(emailC.text)) {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text('Perhatian'),
            contentPadding: EdgeInsets.all(20),
            children: [Text('Masukkan alamat email yang valid')],
          );
        },
      );
      return;
    }

    if (passC.text.length < 6) {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text('Perhatian'),
            contentPadding: EdgeInsets.all(20),
            children: [Text('Password harus terdiri dari minimal 6 karakter')],
          );
        },
      );
      return;
    }
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
      Map body = {'identifier': emailC.text.trim(), 'password': passC.text};
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 201) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);

        var token = jsonData['data']['token'];
        final SharedPreferences tkne = await _prefs;
        await tkne.setString('token', token);

        List<dynamic> menuJsonList = jsonData['data']['menus'];
        List<Menu> menuList =
            menuJsonList.map((e) => Menu.fromJson(e)).toList();

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(_keyMenuList, jsonEncode(menuList));

        Get.offAllNamed(Routes.HOME);
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occurred";
      }
    } catch (error) {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text('Error'),
            contentPadding: EdgeInsets.all(20),
            children: [Text("Wrong Email And Password")],
          );
        },
      );
    }
  }

  static Future<List<Menu>> retrieveStoredData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? menuListJson = prefs.getString(_keyMenuList);

    if (menuListJson != null) {
      // Parse stored JSON data
      final List<dynamic> jsonData = jsonDecode(menuListJson);
      final List<Menu> menuList =
          jsonData.map((e) => Menu.fromJson(e)).toList();
      return menuList;
    } else {
      return []; // Return empty list if no data is stored
    }
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
