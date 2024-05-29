import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/model/leads.dart';

class DetailLeadsController extends GetxController {
  TextEditingController date = TextEditingController();
  Rx<DateTime> selectedDate = DateTime.now().obs;

  TextEditingController pproyek = TextEditingController();
  TextEditingController statusl = TextEditingController();

  RxString hintText = "Tanggal :".obs;

  List<String> followUpOptions = ['Cold', 'Reserved', 'Hot Prospek', 'ok'];

  String? selectedFollowUpOption;

  // Your existing code...

  Future<void> updateLeadsData(Datum leads) async {
    // Implement your API call here to update the leads data
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

  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumController;
  late TextEditingController sumDController;
  late TextEditingController sumOfController;
  late TextEditingController lokController;
  late TextEditingController npwpController;
  late TextEditingController cityController;
  late TextEditingController typeController;
  late TextEditingController areaController;
  late TextEditingController omzetController;
  // Add controllers for other fields as needed

  @override
  void onInit() {
    super.onInit();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumController = TextEditingController();
    sumDController = TextEditingController();
    sumOfController = TextEditingController();
    lokController = TextEditingController();
    npwpController = TextEditingController();
    cityController = TextEditingController();
    typeController = TextEditingController();
    areaController = TextEditingController();
    omzetController = TextEditingController();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneNumController.dispose();
    sumDController.dispose();
    sumOfController.dispose();
    lokController.dispose();
    npwpController.dispose();
    cityController.dispose();
    typeController.dispose();
    areaController.dispose();
    omzetController.dispose();
    super.onClose();
  }
}
