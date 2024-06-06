import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/constant/data/api.dart';
import '../../../../routes/app_pages.dart';
import '../model/login_model.dart';

class LoginProvider extends GetConnect {
  static const String _keyMenuList = 'menuList';
  static const String _keyUser = 'user';

  Future<void> login(String email, String password) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url =
          '${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.loginEmail}';
      var body = {'identifier': email.trim(), 'password': password};
      var response = await post(url, body, headers: headers);

      if (response.statusCode == 201) {
        Map<String, dynamic> jsonData = response.body as Map<String, dynamic>;
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        var token = jsonData['data']['token'];
        await prefs.setString('token', token);

        var user = jsonData['data']['user'];
        await prefs.setString(_keyUser, jsonEncode(user));

        List<dynamic> menuJsonList = jsonData['data']['menus'];
        List<Menu> menuList =
            menuJsonList.map((e) => Menu.fromJson(e)).toList();

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
}
