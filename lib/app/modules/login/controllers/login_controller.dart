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
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
      Map body = {'identifier': emailC.text.trim(), 'password': passC.text};
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 201) {
        // Parse the response body
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        print(response.body);
        var token = jsonData['data']['token'];
        final SharedPreferences tkne = await _prefs;
        await tkne.setString('token', token);

        // Convert menu data to a list of Menu objects
        List<dynamic> menuJsonList = jsonData['data']['menus'];
        List<Menu> menuList =
            menuJsonList.map((e) => Menu.fromJson(e)).toList();

        // Store the menu list using SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(_keyMenuList, jsonEncode(menuList));

        // Navigate to the home screen
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
            children: [Text(error.toString())],
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
}
