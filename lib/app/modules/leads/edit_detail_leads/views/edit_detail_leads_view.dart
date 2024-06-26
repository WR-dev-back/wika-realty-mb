import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/utils/constant/style/app_color.dart';
import 'package:wr_project/app/utils/constant/style/text_styles.dart';
import '../controllers/edit_detail_leads_controller.dart';

class EditDetailLeadsView extends GetView<EditDetailLeadsController> {
  EditDetailLeadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leads = Get.arguments;
    controller.fullNameController.text = leads.fullName;
    controller.emailController.text = leads.email;
    controller.phoneNumController.text = leads.phoneNumber;
    controller.sumDController.text = leads.digitalSource ?? '';
    controller.sumOfController.text = leads.offlineSource ?? '';
    controller.lokController.text = leads.locationOffline ?? '';
    controller.npwpController.text = leads.npwp;
    controller.cityController.text = leads.city ?? '';
    controller.typeController.text = leads.type ?? '';
    controller.areaController.text = leads.area.toString();
    controller.omzetController.text = leads.omzet ?? '';

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: AppColor.primary,
        title: Text(
          "Edit Leads",
          style: TextStyles.titleLabelStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller.fullNameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                labelStyle: TextStyles.approvalTextStyle,
              ),
              style: TextStyles.buttonprofileTextStyle,
            ),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyles.approvalTextStyle,
              ),
              style: TextStyles.buttonprofileTextStyle,
            ),
            TextField(
              controller: controller.phoneNumController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyles.approvalTextStyle,
              ),
              style: TextStyles.buttonprofileTextStyle,
            ),
            TextField(
              controller: controller.sumDController,
              decoration: InputDecoration(
                labelText: 'Sumber Digital',
                labelStyle: TextStyles.approvalTextStyle,
              ),
              style: TextStyles.buttonprofileTextStyle,
            ),
            TextField(
              controller: controller.sumOfController,
              decoration: InputDecoration(
                labelText: 'Sumber Offline',
                labelStyle: TextStyles.approvalTextStyle,
              ),
              style: TextStyles.buttonprofileTextStyle,
            ),
            TextField(
              controller: controller.lokController,
              decoration: InputDecoration(
                labelText: 'Lokasi',
                labelStyle: TextStyles.approvalTextStyle,
              ),
              style: TextStyles.buttonprofileTextStyle,
            ),
            TextField(
              controller: controller.npwpController,
              decoration: InputDecoration(
                labelText: 'Npwp',
                labelStyle: TextStyles.approvalTextStyle,
              ),
              style: TextStyles.buttonprofileTextStyle,
            ),
            TextField(
              controller: controller.cityController,
              decoration: InputDecoration(
                labelText: 'City',
                labelStyle: TextStyles.approvalTextStyle,
              ),
              style: TextStyles.buttonprofileTextStyle,
            ),
            TextField(
              controller: controller.typeController,
              decoration: InputDecoration(
                labelText: 'Type',
                labelStyle: TextStyles.approvalTextStyle,
              ),
              style: TextStyles.buttonprofileTextStyle,
            ),
            TextField(
              controller: controller.areaController,
              decoration: InputDecoration(
                labelText: 'Area',
                labelStyle: TextStyles.approvalTextStyle,
              ),
              style: TextStyles.buttonprofileTextStyle,
            ),
            TextField(
              controller: controller.omzetController,
              decoration: InputDecoration(
                labelText: 'Omzet',
                labelStyle: TextStyles.approvalTextStyle,
              ),
              style: TextStyles.buttonprofileTextStyle,
            ),
            // Add input fields for other lead properties
            SizedBox(height: 20),
            Center(
              child: Container(
                width: 140,
                child: ElevatedButton(
                  onPressed: () {
                    controller.updateLeadsData(leads.id, leads);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4B70F5),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyles.btnLabelStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
