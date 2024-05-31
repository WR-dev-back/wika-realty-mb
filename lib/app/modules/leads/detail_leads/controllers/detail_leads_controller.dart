import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/common/model/leads.dart';

class DetailLeadsController extends GetxController {
  TextEditingController date = TextEditingController();
  Rx<DateTime> selectedDate = DateTime.now().obs;

  TextEditingController pproyek = TextEditingController();
  TextEditingController statusl = TextEditingController();

  RxString hintText = "Tanggal :".obs;

  List<String> followUpOptions = ['Cold', 'Reserved', 'Hot Prospek', 'ok'];

  String? selectedFollowUpOption;

  // Initialize all controllers directly
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController sumDController = TextEditingController();
  TextEditingController sumOfController = TextEditingController();
  TextEditingController lokController = TextEditingController();
  TextEditingController npwpController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController omzetController = TextEditingController();

  // Add controllers for other fields as needed

  // Function to update leads data
  Future<void> updateLeadsData(Datum leads) async {
    try {
      // Perform the API call to update the leads data
      // For example:
      // final response = await http.put(updateLeadsUrl, body: updatedLeadsData);

      // Check the response status code
      // if (response.statusCode == 200) {
      //   // Data updated successfully
      // } else {
      //   // Error handling
      // }
    } catch (error) {
      // Handle errors
      print('Error updating leads data: $error');
    }
  }

  // Function to show follow-up dialog
  void showFollowUpDialog() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      // Update the hint text with the selected date
      hintText.value = "Tanggal : ${picked.toString().split(' ')[0]}";
    }
  }
}
