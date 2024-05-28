import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wr_project/app/model/leads.dart';

import '../../../data/api.dart';

class LeadsController extends GetxController {
  late List<Datum> _leads = [];
  late RxList<Datum> _filteredLeads = RxList<Datum>();
  List<Datum> get filteredLeads => _filteredLeads;
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
    searchController.addListener(() {
      filterLeads(searchController.text);
    });
  }

  Future<List<Datum>> fetchDataLeads() async {
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
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          final leadsData = Leads.fromJson(responseData);
          _leads = leadsData.data;
          _filteredLeads.addAll(_leads);
          return _leads;
        } else {
          print('Request failed: ${response.statusCode}');
          return [];
        }
      } else {
        print('Token not found');
        return [];
      }
    } catch (error) {
      print('Error fetching data: $error');
      return [];
    } finally {
      stopFetching();
    }
  }

  void filterLeads(String query) {
    _filteredLeads.clear();
    if (query.isEmpty) {
      _filteredLeads.addAll(_leads);
    } else {
      _filteredLeads.addAll(_leads.where((lead) {
        return lead.fullName.toLowerCase().contains(query.toLowerCase());
      }));
    }
  }

  void resetSearch() {
    searchController.clear();
    filterLeads('');
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
        var response = await http.post(
          url,
          headers: {
            'accept': '*/*',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(data),
        );

        if (response.statusCode == 201) {
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
        } else {
          print('Gagal mengirim data: ${response.statusCode}');
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
