import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/follow_up_leads_provider.dart';

class FollowupLeadsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final FollowUpLeadsProvider _followUpLeadsProvider = FollowUpLeadsProvider();

  late TabController tabController;

  var followUpCount = 0.obs;
  var prospectsCount = 0.obs;

  TextEditingController dateController = TextEditingController();
  Rx<DateTime> selectedDate = DateTime.now().obs;
  TextEditingController followUpController = TextEditingController();
  TextEditingController prospectsController = TextEditingController();
  RxString hintText = "".obs;
  final followUpOptions = ['cold', 'reserved', 'hot prospek', 'ok'];

  RxString selectedFollowUpOption = ''.obs;

  RxBool followUp1Completed = false.obs;
  RxBool followUp2Completed = false.obs;
  RxBool followUp3Completed = false.obs;

  Map<String, dynamic> followUp1Data = {};
  Map<String, dynamic> followUp2Data = {};
  Map<String, dynamic> followUp3Data = {};

  int currentFollowUpType = 1;
  RxBool isFormValid = false.obs;

  SharedPreferences? _prefs;

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(onTabChange);
    _prefs = await SharedPreferences.getInstance();

    final leads = Get.arguments as dynamic;
    final leadId = leads?.id;

    await loadFollowUpData(leadId);

    followUpController.addListener(() {
      followUpCount.value = followUpController.text.length;
    });

    prospectsController.addListener(() {
      prospectsCount.value = prospectsController.text.length;
    });
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

  void updateCount(RxInt counter, String value) {
    counter.value = value.length;
  }

  void onTabChange() {
    currentFollowUpType = tabController.index + 1;
    loadFormData(currentFollowUpType);
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
                followUp1Data = {
                  'date': followUp['date'],
                  'follow_up': followUp['follow_up'],
                  'prospects': followUp['prospects'],
                  'status': followUp['status'],
                };
              } else if (followUp['type'] == 2) {
                followUp2Completed.value = true;
                followUp2Data = {
                  'date': followUp['date'],
                  'follow_up': followUp['follow_up'],
                  'prospects': followUp['prospects'],
                  'status': followUp['status'],
                };
              } else if (followUp['type'] == 3) {
                followUp3Completed.value = true;
                followUp3Data = {
                  'date': followUp['date'],
                  'follow_up': followUp['follow_up'],
                  'prospects': followUp['prospects'],
                  'status': followUp['status'],
                };
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
            loadFormData(currentFollowUpType);
          }
        }
      } else {
        Get.snackbar('Error', 'Failed to load follow-up data');
      }
    } catch (e) {
      Get.snackbar('Error', 'Selesaikan Semua Follow Up Terlebih Dahulu');
    }
  }

  void loadFormData(int followUpType) {
    if (followUpType == 1) {
      dateController.text = formatDate(followUp1Data['date'] ?? '');
      followUpController.text = followUp1Data['follow_up'] ?? '';
      prospectsController.text = followUp1Data['prospects'] ?? '';
      selectedFollowUpOption.value =
          followUp1Data['status'] ?? ''; // Set to empty if null
      hintText.value = " ${followUp1Data['date'] ?? ''}";
    } else if (followUpType == 2) {
      dateController.text = formatDate(followUp2Data['date'] ?? '');
      followUpController.text = followUp2Data['follow_up'] ?? '';
      prospectsController.text = followUp2Data['prospects'] ?? '';
      selectedFollowUpOption.value =
          followUp2Data['status'] ?? ''; // Set to empty if null
      hintText.value = "${followUp2Data['date'] ?? ''}";
    } else if (followUpType == 3) {
      dateController.text = formatDate(followUp3Data['date'] ?? '');
      followUpController.text = followUp3Data['follow_up'] ?? '';
      prospectsController.text = followUp3Data['prospects'] ?? '';
      selectedFollowUpOption.value =
          followUp3Data['status'] ?? ''; // Set to empty if null
      hintText.value = "${followUp3Data['date'] ?? ''}";
    } else {
      dateController.clear();
      followUpController.clear();
      prospectsController.clear();
      hintText.value = "";
      selectedFollowUpOption.value = ''; // Set to empty for no input
    }

    // Ensure the selected option exists in the follow-up options
    if (!followUpOptions.contains(selectedFollowUpOption.value)) {
      selectedFollowUpOption.value = ''; // Set to empty if it's not in options
    }

    validateForm();
  }

  String formatDate(String isoDate) {
<<<<<<< HEAD
    try {
      DateTime date = DateTime.parse(isoDate);
      return DateFormat('dd MMMM yyyy')
          .format(date); // Adjust the date format as needed
    } catch (e) {
      // Handle the FormatException
      print('Error parsing date: $e');
      return isoDate; // Return the original string if parsing fails
=======
    if (isoDate.isEmpty) {
      return ''; // Handle empty date string as needed
    }

    try {
      DateTime date = DateTime.parse(isoDate);
      return DateFormat('dd MMMM yyyy')
          .format(date); // Adjust date format as needed
    } catch (e) {
      print('Error parsing date: $e');
      return ''; // Handle error in date parsing
>>>>>>> a2f0f05658bbf3ef1d1d8508a574b7a65a350f7c
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
    if (selectedFollowUpOption.value.isEmpty) {
      Get.snackbar('Error', 'Please select a follow-up status');
      return;
    }

    final body = {
      'type': currentFollowUpType,
      'date': selectedDate.value.toIso8601String(),
      'follow_up': followUpController.text,
      'prospects': prospectsController.text,
      'status': selectedFollowUpOption.value,
    };

    try {
      final response =
          await _followUpLeadsProvider.updateFollowUp(leadId, body);

      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Leads data updated successfully');

        if (currentFollowUpType == 1) {
          followUp1Completed.value = true;
          followUp1Data = body;
        } else if (currentFollowUpType == 2) {
          followUp2Completed.value = true;
          followUp2Data = body;
        } else if (currentFollowUpType == 3) {
          followUp3Completed.value = true;
          followUp3Data = body;
        }

        await _prefs?.setBool('followUp1Completed', followUp1Completed.value);
        await _prefs?.setBool('followUp2Completed', followUp2Completed.value);
        await _prefs?.setBool('followUp3Completed', followUp3Completed.value);
        await _prefs?.setString('followUpOption', selectedFollowUpOption.value);

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
      selectedFollowUpOption.value = '';

      validateForm();
    }
  }

  void validateForm() {
    isFormValid.value = dateController.text.isNotEmpty &&
        followUpController.text.isNotEmpty &&
        prospectsController.text.isNotEmpty &&
        selectedFollowUpOption.value.isNotEmpty &&
        !isAllFollowUpsCompleted();
  }

  bool isAllFollowUpsCompleted() {
    return followUp1Completed.value &&
        followUp2Completed.value &&
        followUp3Completed.value;
  }
}
