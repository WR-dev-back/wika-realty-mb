import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/follow_up_leads_provider.dart';

class FollowupLeadsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final FollowUpLeadsProvider _followUpLeadsProvider = FollowUpLeadsProvider();

  late TabController tabController;

  TextEditingController dateController = TextEditingController();
  Rx<DateTime> selectedDate = DateTime.now().obs;
  TextEditingController followUpController = TextEditingController();
  TextEditingController prospectsController = TextEditingController();
  RxString hintText = "Tanggal :".obs;
  List<String> followUpOptions = ['Cold', 'Reserved', 'Hot Prospek', 'ok'];
  String? selectedFollowUpOption;

  // RxBools to track completion status of follow-ups
  RxBool followUp1Completed = false.obs;
  RxBool followUp2Completed = false.obs;
  RxBool followUp3Completed = false.obs;

  // Variable to track current follow-up type
  int currentFollowUpType = 1;

  // RxBool to track form validity
  RxBool isFormValid = false.obs;

  SharedPreferences? _prefs;

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    _prefs = await SharedPreferences.getInstance();

    final leads = Get.arguments as dynamic;
    final leadId = leads?.id;

    await loadFollowUpData(leadId);

    // Listen to changes in text fields to validate form
    followUpController.addListener(validateForm);
    prospectsController.addListener(validateForm);
    dateController.addListener(validateForm);
  }

  @override
  void onClose() {
    tabController.dispose();
    followUpController.dispose();
    prospectsController.dispose();
    dateController.dispose();
    super.onClose();
  }

  Future<void> loadFollowUpData(String leadId) async {
    try {
      final response = await _followUpLeadsProvider.getFollowUpData();

      if (response.statusCode == 200) {
        final data = response.body;
        print(data);

        if (data['data'].isNotEmpty) {
          final lead = data['data'].firstWhere((lead) => lead['id'] == leadId);
          final leadFollowUps = lead['LeadFollowUp'];

          if (leadFollowUps.isNotEmpty) {
            for (var followUp in leadFollowUps) {
              if (followUp['type'] == 1) {
                followUp1Completed.value = true;
                dateController.text = followUp['date'];
                followUpController.text = followUp['follow_up'];
                prospectsController.text = followUp['prospects'];
                selectedFollowUpOption = followUp['status'];
                hintText.value = "Tanggal : ${followUp['date']}";
              } else if (followUp['type'] == 2) {
                followUp2Completed.value = true;
                // Populate follow-up 2 fields if necessary
              } else if (followUp['type'] == 3) {
                followUp3Completed.value = true;
                // Populate follow-up 3 fields if necessary
              }
            }

            if (followUp1Completed.value && !followUp2Completed.value) {
              currentFollowUpType = 2;
              tabController.index = 1;
            } else if (followUp1Completed.value &&
                followUp2Completed.value &&
                !followUp3Completed.value) {
              currentFollowUpType = 3;
              tabController.index = 2;
            }
          }
        }
      } else {
        Get.snackbar('Error', 'Failed to load follow-up data');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while loading follow-up data');
    }
  }

  Future<void> showFollowUpDialog() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      hintText.value = "Tanggal : ${picked.toString().split(' ')[0]}";
      dateController.text = picked.toString().split(' ')[0];
    }
  }

  Future<void> updateFollowUp(String leadId) async {
    if (selectedFollowUpOption == null) {
      Get.snackbar('Error', 'Please select a follow-up status');
      return;
    }

    final body = {
      'type': currentFollowUpType,
      'date': selectedDate.value.toIso8601String(),
      'follow_up': followUpController.text,
      'prospects': prospectsController.text,
      'status': selectedFollowUpOption!,
    };

    try {
      final response =
          await _followUpLeadsProvider.updateFollowUp(leadId, body);

      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Leads data updated successfully');

        if (currentFollowUpType == 1) {
          followUp1Completed.value = true;
        } else if (currentFollowUpType == 2) {
          followUp2Completed.value = true;
        } else if (currentFollowUpType == 3) {
          followUp3Completed.value = true;
        }

        await _prefs?.setBool('followUp1Completed', followUp1Completed.value);
        await _prefs?.setBool('followUp2Completed', followUp2Completed.value);
        await _prefs?.setBool('followUp3Completed', followUp3Completed.value);
        await _prefs?.setString('followUpOption', selectedFollowUpOption!);

        moveToNextFollowUpType();
      } else {
        Get.snackbar('Error', 'Failed to update leads data');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while updating leads data');
    }
  }

  bool isNextFollowUpTypeEnabled(int type) {
    if (type == 2) {
      return followUp1Completed.value;
    } else if (type == 3) {
      return followUp2Completed.value;
    } else if (type == 4) {
      return followUp3Completed.value;
    } else {
      return true;
    }
  }

  void moveToNextFollowUpType() {
    if (currentFollowUpType < 3) {
      currentFollowUpType++;
      tabController.animateTo(currentFollowUpType - 1);

      dateController.clear();
      followUpController.clear();
      prospectsController.clear();
      hintText.value = "Tanggal :";
      selectedFollowUpOption = null;

      validateForm();
    }
  }

  void validateForm() {
    isFormValid.value = dateController.text.isNotEmpty &&
        followUpController.text.isNotEmpty &&
        prospectsController.text.isNotEmpty &&
        selectedFollowUpOption != null;
  }
}
