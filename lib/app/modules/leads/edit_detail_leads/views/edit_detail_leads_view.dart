import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    controller.omzetController.text = leads.omzet.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Leads"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller.fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: controller.phoneNumController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: controller.sumDController,
              decoration: InputDecoration(labelText: 'Sumber Digital'),
            ),
            TextField(
              controller: controller.sumOfController,
              decoration: InputDecoration(labelText: 'Sumber Offline'),
            ),
            TextField(
              controller: controller.lokController,
              decoration: InputDecoration(labelText: 'Lokasi'),
            ),
            TextField(
              controller: controller.npwpController,
              decoration: InputDecoration(labelText: 'Npwp'),
            ),
            TextField(
              controller: controller.cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            TextField(
              controller: controller.typeController,
              decoration: InputDecoration(labelText: 'Type'),
            ),
            TextField(
              controller: controller.areaController,
              decoration: InputDecoration(labelText: 'Area'),
            ),
            TextField(
              controller: controller.omzetController,
              decoration: InputDecoration(labelText: 'Omzet'),
            ),
            // Add input fields for other lead properties
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.updateLeadsData(leads.id, leads);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
