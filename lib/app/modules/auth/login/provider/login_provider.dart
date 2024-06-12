import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/constant/data/api.dart';
import '../../../../routes/app_pages.dart';

class LoginProvider extends GetConnect {
  final GetStorage storage = GetStorage();

  Future<void> login(String email, String password) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url =
          '${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.loginEmail}';
      var body = {'identifier': email.trim(), 'password': password};
      var response = await post(url, body, headers: headers);

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
