import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wr_project/app/model/leads.dart';
import 'package:wr_project/app/routes/app_pages.dart';

import '../../../data/api.dart';

class LeadsController extends GetxController {
  var filteredLeads = List<Datum>.empty().obs;
  TextEditingController searchController = TextEditingController();

  var isFetching = false.obs;

  void startFetching() {
    isFetching(true);
  }

  void stopFetching() {
    isFetching(false);
  }

  @override
  void onInit() {
    super.onInit();
    fetchDataLeads();
  }

  Future<void> fetchDataLeads() async {
    startFetching();

    var apiUrl =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.getDataLeads.dataLeads);

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      if (token != null) {
        http.Response response = await http.get(
          apiUrl,
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          Leads leadsData = leadsFromJson(response.body);
          filteredLeads.value = leadsData.data;
        } else {
          print('Request failed: ${response.statusCode}');
        }
      } else {
        print('Token not found');
      }
    } catch (error) {
      print('Error fetching data: $error');
    } finally {
      stopFetching();
    }
  }

  Future<void> searchLeads(String query) async {
    startFetching();

    var apiUrl = Uri.parse(ApiEndPoints.baseUrl +
        ApiEndPoints.getDataLeads.dataLeads +
        '&search=$query');

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      if (token != null) {
        var response = await http.get(
          apiUrl,
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          Leads leadsData = leadsFromJson(response.body);
          filteredLeads.value = leadsData.data;
        } else {
          print('Failed to search data: ${response.statusCode}');
        }
      }
    } catch (e) {
      print('Error searching data: $e');
    } finally {
      stopFetching();
    }
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  TextEditingController email = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  TextEditingController sumD = TextEditingController();
  TextEditingController sumOf = TextEditingController();
  TextEditingController lok = TextEditingController();
  TextEditingController npwpC = TextEditingController();
  TextEditingController cityC = TextEditingController();
  TextEditingController typeC = TextEditingController();
  TextEditingController areaC = TextEditingController();
  TextEditingController omzetC = TextEditingController();

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
    var url =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.postDataLeads.postLeads);

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
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      if (token != null) {
        // var response = await http.post(
        //   url,
        //   headers: {
        //     'accept': '*/*',
        //     'Content-Type': 'application/json',
        //     'Authorization': 'Bearer $token',
        //   },
        //   body: jsonEncode(data),
        // );

        final response = Response(201);

        if (response.statusCode == 201) {
          showDialog(
            context: Get.context!,
            builder: (context) {
              return SimpleDialog(
                title: Text('Berhasil'),
                contentPadding: EdgeInsets.all(20),
                children: [Text("Data Berhasil Dikirim")],
              );
            },
          );
          print('Data berhasil dikirim');

          // Clear all TextEditingController after successful submission

          phoneNum.clear();
          sumD.clear();
          sumOf.clear();
          lok.clear();
          npwpC.clear();
          cityC.clear();
          typeC.clear();
          areaC.clear();
          omzetC.clear();

          Get.back();
          Get.toNamed(Routes.LEADS);
        } else {
          print('Gagal mengirim data: ${response.statusCode}');
          showDialog(
            context: Get.context!,
            builder: (context) {
              return SimpleDialog(
                title: Text('Error'),
                contentPadding: EdgeInsets.all(20),
                children: [
                  Text('Gagal mengirim data: ${response.statusCode}'),
                ],
              );
            },
          );
        }
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  var isRefreshing = false.obs;

  Future<void> refreshData() async {
    isRefreshing(true);

    await Future.delayed(Duration(seconds: 2));

    isRefreshing(false);
  }
}

class Response {
  final int statusCode;
  Response(this.statusCode);
}
