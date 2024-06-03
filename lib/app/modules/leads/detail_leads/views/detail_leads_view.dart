import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wr_project/app/common/model/leads.dart';
import 'package:wr_project/app/routes/app_pages.dart';
import 'package:wr_project/app/utils/constant/style/app_color.dart';

import '../controllers/detail_leads_controller.dart';

class DetailLeadsView extends GetView<DetailLeadsController> {
  DetailLeadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leads = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Leads View',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    Get.toNamed(
                      Routes.EDIT_DETAIL_LEADS,
                      arguments: {
                        leads: leads,
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.edit),
                      Text("Edit"),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return FollowUpDialog(
                          controller: controller,
                          leads: leads,
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.follow_the_signs,
                        color: Colors.white,
                      ),
                      Text(
                        "Follow Up",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name: ${leads?.fullName}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Email: ${leads?.email}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Phone Number: ${leads?.phoneNumber}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Sumber Digital: ${leads?.digitalSource}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Sumber Offline: ${leads?.offlineSource}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Lokasi Kegiatan: ${leads?.locationOffline}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Npwp: ${leads?.npwp}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'City: ${leads?.city}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Type: ${leads?.type}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Area: ${leads?.area}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Omzet: ${leads?.omzet}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FollowUpDialog extends StatelessWidget {
  final DetailLeadsController controller;
  final Datum leads;
  FollowUpDialog({required this.controller, required this.leads});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Follow Up ${leads.fullName}"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => TextFormField(
              readOnly: true,
              controller: controller.date,
              decoration: InputDecoration(
                  hintText: Get.find<DetailLeadsController>().hintText.value),
              onTap: () =>
                  Get.find<DetailLeadsController>().showFollowUpDialog(),
            ),
          ),
          TextField(
            controller: controller.pproyek,
            decoration: InputDecoration(hintText: "Remake"),
          ),
          TextField(
            controller: controller.statusl,
            decoration: InputDecoration(hintText: "Pertimbangan Proyek"),
          ),
          DropdownButtonFormField(
            value: controller.selectedFollowUpOption,
            items: controller.followUpOptions.map((option) {
              return DropdownMenuItem(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (value) {
              controller.selectedFollowUpOption = value;
            },
            decoration: InputDecoration(
              hintText: 'Status Leads',
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text("Save"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
