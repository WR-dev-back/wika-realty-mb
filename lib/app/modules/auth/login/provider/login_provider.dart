import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import '../../../../utils/constant/data/api.dart';

class LoginProvider extends GetConnect {
  Future<Response> login(String email, String password) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url =
          '${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.loginEmail}';
      var body = jsonEncode({'identifier': email.trim(), 'password': password});
      var response = await post(url, body, headers: headers);
      return response;
    } catch (error) {
      if (error is GetHttpException) {
        showErrorDialog("No internet connection");
      } else {
        showErrorDialog("An unexpected error occurred");
      }
      rethrow; // rethrow the error to let the caller know something went wrong
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
