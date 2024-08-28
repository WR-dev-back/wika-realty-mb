import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/modules/leads/provider/leads_provider.dart';

import '../../../common/models/leads.dart';
import '../../../routes/app_pages.dart';

class LeadsController extends GetxController {
  var filteredLeads = List<Datum>.empty().obs;
  TextEditingController searchController = TextEditingController();
  var isFetching = false.obs;
  var isSearching = false.obs;
  var hasError = false.obs;
  final LeadsProvider leadsProvider = Get.find();
  ScrollController scrollController = ScrollController();
  var searchType = 'fullname'.obs;

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

  var currentPage = 1.obs;
  var totalPages = 1.obs;

  void startFetching() => isFetching(true);

  void stopFetching() => isFetching(false);

  var digitalSourceCount = 0.obs;
  var offlineSourceCount = 0.obs;
  var locationCount = 0.obs;
  var fullNameCount = 0.obs;
  var phoneCount = 0.obs;
  var npwpCount = 0.obs;
  var emailCount = 0.obs;
  var cityCount = 0.obs;
  var typeCount = 0.obs;
  var areaCount = 0.obs;
  var omzetCount = 0.obs;

  void updateCount(RxInt counter, String text) {
    counter.value = text.length;
  }

  @override
  void onInit() {
    super.onInit();
    fetchDataLeads(page: 1);

    scrollController.addListener(
      () {
        // Check if the user has scrolled to the bottom and if more pages are available
        if (scrollController.position.pixels ==
                scrollController.position.maxScrollExtent &&
            currentPage.value < totalPages.value &&
            !isFetching.value) {
          // Ensure no duplicate requests
          loadMoreData();
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

  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full Name is required';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    } else if (!RegExp(r'^\+?\d{10,15}$').hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  Future<void> fetchDataLeads({int page = 1}) async {
    try {
      isFetching(true);
      hasError(false);

      print("Fetching data for page: $page");

      // Directly fetch the leads data from the provider
      final List<Datum> response =
          await leadsProvider.fetchDataLeads(page: page);

      print("Data fetched successfully: ${response.length} leads");

      if (page == 1) {
        // Replace the list if it's the first page
        filteredLeads.value = response;
      } else {
        // Append to the existing list for additional pages
        filteredLeads.addAll(response);
      }

      // Assuming 'page' and 'pageCount' values are stored in leadsProvider
      currentPage.value = page;
      totalPages.value = leadsProvider.totalPages.value;
    } catch (error) {
      hasError(true);
      print("Error fetching data: $error"); // Log the error
      Get.snackbar('Error', 'Error fetching data');
    } finally {
      isFetching(false);
    }
  }

  Future<void> searchLeads(String query) async {
    startFetching();
    try {
      filteredLeads.value =
          (await leadsProvider.searchLeads(query, searchType.value))!;
    } catch (error) {
      print('Error searching data: $error');
    } finally {
      stopFetching();
    }
  }

  Future<void> loadMoreData() async {
    if (currentPage.value < totalPages.value) {
      if (!scrollController.hasClients) {
        return;
      }

      double currentScrollPosition = scrollController.position.pixels;

      isFetching(true);

      await Future.delayed(Duration(seconds: 1));

      await fetchDataLeads(page: currentPage.value + 1);

      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.jumpTo(currentScrollPosition);
        }
      });

      isFetching(false);
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
    required String omzet,
  }) async {
    try {
      bool isDuplicate = await leadsProvider.checkDuplicate(
        email: email,
        phone: phone,
        npwp: npwp,
      );

      if (isDuplicate) {
        Get.snackbar('Error', 'Npwp, Email, Nomor Handphone tealah Dipakai');
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
    await fetchDataLeads(page: 1);
    isRefreshing(false);
  }
}
