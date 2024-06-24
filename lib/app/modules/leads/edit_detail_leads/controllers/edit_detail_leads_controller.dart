import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/routes/app_pages.dart';

import '../../../../common/models/leads.dart';
import '../../controllers/leads_controller.dart';
import '../provider/edit_detail_leads.dart';

class EditDetailLeadsController extends GetxController {
  final EditDetailLeadsProvider _editDetailLeadsProvider =
      EditDetailLeadsProvider();

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

  var fullNameCount = 0.obs;
  var emailCount = 0.obs;
  var phoneCount = 0.obs;
  var digitalSourceCount = 0.obs;
  var offlineSourceCount = 0.obs;
  var locationCount = 0.obs;
  var npwpCount = 0.obs;
  var cityCount = 0.obs;
  var typeCount = 0.obs;
  var areaCount = 0.obs;
  var omzetCount = 0.obs;

  // Method to update character count
  void updateCount(RxInt counter, String text) {
    counter.value = text.length;
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

  // Function to update leads data
  Future<void> updateLeadsData(String leadId, Datum leads) async {
    try {
      leads.fullName = fullNameController.text;
      leads.email = emailController.text;
      leads.phoneNumber = phoneNumController.text;
      leads.digitalSource = sumDController.text;
      leads.offlineSource = sumOfController.text;
      leads.locationOffline = lokController.text;
      leads.npwp = npwpController.text;
      leads.city = cityController.text;
      leads.type = typeController.text;
      leads.area = int.tryParse(areaController.text) ?? 0;
      leads.omzet = omzetController.text;

      // Perform the API call to update the leads data
      final response =
          await _editDetailLeadsProvider.updateLeadsData(leadId, leads);

      // Check the response status code
      if (response.statusCode == 200) {
        // Data updated successfully
        final LeadsController leadsController = Get.find<LeadsController>();
        await leadsController.fetchDataLeads();
        Get.offAllNamed(Routes.HOME);
        Get.toNamed(Routes.LEADS);
      } else {
        // Error handling
        print('Error response updating leads data: ${response.statusText}');
      }
    } catch (error) {
      // Handle errors
      print('Error updating leads data: $error');
    }
  }
}
