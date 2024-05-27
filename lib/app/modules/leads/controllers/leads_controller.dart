import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wr_project/app/model/leads.dart';

import '../../../data/api.dart';

class LeadsController extends GetxController {
  late List<Datum> _leads = [];
  late List<Datum> _filteredLeads = [];
  List<Datum> get filteredLeads => _filteredLeads;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchDataLeads();
  }

  Future<List<Datum>> fetchDataLeads() async {
    var apiUrl =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.getDataLeads.dataLeads);

    try {
      http.Response response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final leadsData = Leads.fromJson(responseData);
        _leads = leadsData.data;
        _filteredLeads = _leads;
        return _leads;
      } else {
        print('Request failed: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error fetching data: $error');
      return [];
    }
  }

  void filterLeads(String query) {
    if (query.isEmpty) {
      _filteredLeads = List.from(_leads); // If query is empty, show all leads
    } else {
      _filteredLeads = _leads.where((lead) {
        return lead.fullName.toLowerCase().contains(query.toLowerCase());
      }).toList(); // Filter leads based on the query
    }
    update(); // Update the UI to reflect the changes
  }

  TextEditingController sumD = TextEditingController();
  TextEditingController sumOf = TextEditingController();
  TextEditingController lok = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController npwpC = TextEditingController();
  TextEditingController cityC = TextEditingController();
  TextEditingController salesF = TextEditingController();
  TextEditingController ppuC = TextEditingController();

  var isRefreshing = false.obs;

  Future<void> refreshData() async {
    isRefreshing(true);

    await Future.delayed(Duration(seconds: 2));

    isRefreshing(false);
  }
}
