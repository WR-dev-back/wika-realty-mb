import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wr_project/app/routes/app_pages.dart';
import 'package:wr_project/app/data/api.dart';
import 'package:wr_project/app/model/leads.dart';

import '../model/body.dart';

class ApiService extends GetConnect {
  static const String _keyMenuList = 'menuList';

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
        final SharedPreferences tkne = await SharedPreferences.getInstance();
        await tkne.setString('token', token);

        List<dynamic> menuJsonList = jsonData['data']['menus'];
        List<Menu> menuList =
            menuJsonList.map((e) => Menu.fromJson(e)).toList();

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(_keyMenuList, jsonEncode(menuList));

        print(token);

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

  Future<List<Menu>> retrieveStoredData(bool isMobile) async {
    final prefs = await SharedPreferences.getInstance();
    final String? menuListJson = prefs.getString(_keyMenuList);

    if (menuListJson != null) {
      final List<dynamic> jsonData = jsonDecode(menuListJson);
      final List<Menu> menuList = jsonData
          .map((e) => Menu.fromJson(e))
          .where((menu) => isMobile ? menu.isMobile : !menu.isMobile)
          .toList();
      return menuList;
    } else {
      return [];
    }
  }

  Future<List<Datum>> fetchDataLeads() async {
    var apiUrl =
        '${ApiEndPoints.baseUrl}${ApiEndPoints.getDataLeads.dataLeads}';
    final token = await _getToken();

    if (token != null) {
      final response =
          await get(apiUrl, headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        Leads leadsData = leadsFromJson(response.body);
        return leadsData.data;
      } else {
        print('Request failed: ${response.statusCode}');
        return [];
      }
    } else {
      print('Token not found');
      return [];
    }
  }

  Future<List<Datum>> searchLeads(String query) async {
    var apiUrl =
        '${ApiEndPoints.baseUrl}${ApiEndPoints.getDataLeads.dataLeads}&search=$query';
    final token = await _getToken();

    if (token != null) {
      var response =
          await get(apiUrl, headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        Leads leadsData = leadsFromJson(response.body);
        return leadsData.data;
      } else {
        print('Failed to search data: ${response.statusCode}');
        return [];
      }
    } else {
      print('Token not found');
      return [];
    }
  }

  Future<String?> _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> postDataToBackend({
    required String email,
    required String fullName,
    required String phoneNumber,
    required String digitalSource,
    required String offlineSource,
    required String locationOffline,
    required String npwp,
    required String city,
    required String type,
    required int area,
    required int omzet,
  }) async {
    var url = '${ApiEndPoints.baseUrl}${ApiEndPoints.postDataLeads.postLeads}';
    var data = {
      'email': email,
      'full_name': fullName,
      'phone_number': phoneNumber,
      'digital_source': digitalSource,
      'offline_source': offlineSource,
      'location_offline': locationOffline,
      'npwp': npwp,
      'city': city,
      'type': type,
      'area': area,
      'omzet': omzet,
    };

    try {
      final token = await _getToken();

      if (token != null) {
        var response =
            await post(url, data, headers: {'Authorization': 'Bearer $token'});

        if (response.statusCode == 201) {
          // Handle successful response
          print('Data successfully sent');
        } else {
          // Handle error response
          print('Error: ${response.body}');
        }
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
