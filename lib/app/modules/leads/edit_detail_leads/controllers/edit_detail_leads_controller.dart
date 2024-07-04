import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/common/models/leads.dart';
import 'package:wr_project/app/modules/leads/controllers/leads_controller.dart';
import 'package:wr_project/app/modules/leads/edit_detail_leads/provider/edit_detail_leads.dart';
import 'package:wr_project/app/modules/leads/provider/leads_provider.dart';

import '../../../../routes/app_pages.dart';

class EditDetailLeadsController extends GetxController {
  final EditDetailLeadsProvider _editDetailLeadsProvider =
      EditDetailLeadsProvider();
  final LeadsProvider leadsProvider = Get.find<LeadsProvider>();

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

  late String originalNpwp;
  late String originalEmail;
  late String originalPhoneNum;

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

  void setOriginalValues(String npwp, String email, String phoneNum) {
    originalNpwp = npwp;
    originalEmail = email;
    originalPhoneNum = phoneNum;
  }

  Future<void> updateLeadsData(String leadId, Datum leads) async {
    try {
      bool isNpwpChanged = npwpController.text != originalNpwp;
      bool isEmailChanged = emailController.text != originalEmail;
      bool isPhoneNumChanged = phoneNumController.text != originalPhoneNum;

      bool isDuplicate = false;

      if (isNpwpChanged || isEmailChanged || isPhoneNumChanged) {
        isDuplicate = await leadsProvider.checkDuplicate(
          email: emailController.text,
          phone: phoneNumController.text,
          npwp: npwpController.text,
        );
      }

      if (isDuplicate) {
        Get.snackbar('Error', 'Npwp, Email, Nomor Handphone telah Dipakai');
        return;
      }

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

      final response =
          await _editDetailLeadsProvider.updateLeadsData(leadId, leads);

      if (response.statusCode == 200) {
        final LeadsController leadsController = Get.find<LeadsController>();
        await leadsController.fetchDataLeads();
        Get.offAllNamed(Routes.HOME);
        Get.toNamed(Routes.LEADS);
      } else {
        print('Error response updating leads data: ${response.statusText}');
      }
    } catch (error) {
      print('Error updating leads data: $error');
    }
  }
}
