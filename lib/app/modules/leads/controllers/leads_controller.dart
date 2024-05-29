import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/model/leads.dart';
import 'package:wr_project/app/provider/api_service.dart';

class LeadsController extends GetxController {
  var filteredLeads = List<Datum>.empty().obs;
  TextEditingController searchController = TextEditingController();
  var isFetching = false.obs;
  var apiService = ApiService();

  void startFetching() => isFetching(true);

  void stopFetching() => isFetching(false);

  @override
  void onInit() {
    super.onInit();
    fetchDataLeads();
  }

  Future<void> fetchDataLeads() async {
    startFetching();
    try {
      filteredLeads.value = await apiService.fetchDataLeads();
    } catch (error) {
      print('Error fetching data: $error');
    } finally {
      stopFetching();
    }
  }

  Future<void> searchLeads(String query) async {
    startFetching();
    try {
      filteredLeads.value = await apiService.searchLeads(query);
    } catch (error) {
      print('Error searching data: $error');
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
    try {
      await apiService.postDataToBackend(
        email: email,
        fullName: fullName,
        phoneNumber: phoneNumber,
        digitalSource: digitalSource,
        offlineSource: offlineSource,
        locationOffline: locationOffline,
        npwp: npwp,
        city: city,
        type: type,
        area: area,
        omzet: omzet,
      );
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