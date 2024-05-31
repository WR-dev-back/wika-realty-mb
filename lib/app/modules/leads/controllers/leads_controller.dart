import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/common/model/leads.dart';
import 'package:wr_project/app/modules/leads/provider/leads_provider.dart';

import '../../../routes/app_pages.dart';

class LeadsController extends GetxController {
  var filteredLeads = List<Datum>.empty().obs;
  TextEditingController searchController = TextEditingController();
  var isFetching = false.obs;
  final LeadsProvider leadsProvider = Get.find();
  ScrollController scrollController = ScrollController();

  late TextEditingController email;
  late TextEditingController fullName;
  late TextEditingController phone;
  late TextEditingController sumD;
  late TextEditingController sumOf;
  late TextEditingController lok;
  late TextEditingController npwpC;
  late TextEditingController cityC;
  late TextEditingController typeC;
  late TextEditingController areaC;
  late TextEditingController omzetC;

  var isFormValid = false.obs;

  void startFetching() => isFetching(true);

  void stopFetching() => isFetching(false);

  @override
  void onInit() {
    super.onInit();
    fetchDataLeads();
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          fetchDataLeads();
        }
      },
    );

    email = TextEditingController();
    fullName = TextEditingController();
    phone = TextEditingController();
    sumD = TextEditingController();
    sumOf = TextEditingController();
    lok = TextEditingController();
    npwpC = TextEditingController();
    cityC = TextEditingController();
    typeC = TextEditingController();
    areaC = TextEditingController();
    omzetC = TextEditingController();

    // Add listeners to the controllers
    email.addListener(validateForm);
    fullName.addListener(validateForm);
    phone.addListener(validateForm);
    sumD.addListener(validateForm);
    sumOf.addListener(validateForm);
    lok.addListener(validateForm);
    npwpC.addListener(validateForm);
    cityC.addListener(validateForm);
    typeC.addListener(validateForm);
    areaC.addListener(validateForm);
    omzetC.addListener(validateForm);
  }

  void validateForm() {
    isFormValid.value = email.text.isNotEmpty &&
        fullName.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        sumD.text.isNotEmpty &&
        sumOf.text.isNotEmpty &&
        lok.text.isNotEmpty &&
        npwpC.text.isNotEmpty &&
        cityC.text.isNotEmpty &&
        typeC.text.isNotEmpty &&
        areaC.text.isNotEmpty &&
        omzetC.text.isNotEmpty;
  }

  Future<void> fetchDataLeads() async {
    startFetching();
    try {
      filteredLeads.value = await leadsProvider.fetchDataLeads();
    } catch (error) {
      print('Error fetching data: $error');
    } finally {
      stopFetching();
    }
  }

  Future<void> searchLeads(String query) async {
    startFetching();
    try {
      filteredLeads.value = await leadsProvider.searchLeads(query);
    } catch (error) {
      print('Error searching data: $error');
    } finally {
      stopFetching();
    }
  }

  Future<void> postDataToBackend({
    required String email,
    required String fullName,
    required String phone,
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
      bool isDuplicate = await leadsProvider.checkDuplicate(
        email: email,
        phone: phone,
        npwp: npwp,
      );

      if (isDuplicate) {
        Get.snackbar('Error', 'Duplicate data found');
        return;
      }

      await leadsProvider.postDataToBackend(
        email: email,
        fullName: fullName,
        phone: phone,
        digitalSource: digitalSource,
        offlineSource: offlineSource,
        locationOffline: locationOffline,
        npwp: npwp,
        city: city,
        type: type,
        area: area,
        omzet: omzet,
      );

      Get.offAllNamed(Routes.HOME);
      Get.toNamed(Routes.LEADS);
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

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
    email.dispose();
    fullName.dispose();
    phone.dispose();
    sumD.dispose();
    sumOf.dispose();
    lok.dispose();
    npwpC.dispose();
    cityC.dispose();
    typeC.dispose();
    areaC.dispose();
    omzetC.dispose();
  }
}
