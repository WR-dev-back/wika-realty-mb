import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wr_project/app/modules/leads/follow_up_leads/provider/follow_up_leads_provider.dart';

class FollowupLeadsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final FollowUpLeadsProvider _detailLeadsProvider = FollowUpLeadsProvider();

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

  // Variable to track current follow-up type
  int currentFollowUpType = 1;

  SharedPreferences? _prefs;

  @override
  void onInit() async {
    tabController = TabController(length: 3, vsync: this);
    _prefs = await SharedPreferences.getInstance();
    followUp1Completed.value = _prefs?.getBool('followUp1Completed') ?? false;
    selectedFollowUpOption = _prefs?.getString('followUp1Option');
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  // Function to show follow-up dialog
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

  // Function to update leads data
  Future<void> updateFollowUp(String leadId) async {
    if (selectedFollowUpOption == null) {
      Get.snackbar('Error', 'Please select a follow-up status');
      return;
    }

    final body = {
      'type': currentFollowUpType, // Use the current follow-up type
      'date': selectedDate.value.toIso8601String(),
      'follow_up': followUpController.text,
      'prospects': prospectsController.text,
      'status': selectedFollowUpOption!,
    };

    try {
      final response = await _detailLeadsProvider.updateFollowUp(leadId, body);

      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Leads data updated successfully');

        await _prefs?.setBool('followUp1Completed', followUp1Completed.value);
        await _prefs?.setString('followUp1Option', selectedFollowUpOption!);

        // Mark the current follow-up as completed
        if (currentFollowUpType == 1) {
          followUp1Completed.value = true;
        } else if (currentFollowUpType == 2) {
          followUp2Completed.value = true;
        }

        // Move to the next follow-up type
        moveToNextFollowUpType();
      } else {
        print('Error response updating leads data: ${response.statusText}');
        Get.snackbar('Error', 'Failed to update leads data');
      }
    } catch (e) {
      print('Error updating leads data: $e');
      Get.snackbar('Error', 'An error occurred while updating leads data');
    }
  }

  // Function to check if next follow-up type is enabled
  bool isNextFollowUpTypeEnabled(int type) {
    if (type == 2) {
      return followUp1Completed
          .value; // Follow-up 2 enabled if follow-up 1 is completed
    } else if (type == 3) {
      return followUp2Completed
          .value; // Follow-up 3 enabled if follow-up 2 is completed
    } else {
      return true; // Follow-up 1 is always enabled
    }
  }

  // Function to move to the next follow-up type
  void moveToNextFollowUpType() {
    if (currentFollowUpType < 3) {
      currentFollowUpType++;
      tabController.animateTo(currentFollowUpType - 1); // Move to the next tab

      // Clear the text controllers for the new follow-up type
      dateController.clear();
      followUpController.clear();
      prospectsController.clear();
      hintText.value = "Tanggal :";
      selectedFollowUpOption = null;
    }
  }
}
