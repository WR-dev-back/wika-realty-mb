import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wr_project/app/modules/leads/views/leads_view.dart';
import 'package:wr_project/app/style/app_color.dart';

import '../controllers/detail_leads_controller.dart';

class DetailLeadsView extends GetView<DetailLeadsController> {
  DetailLeadsView({Key? key}) : super(key: key);
  final Leads leads = Get.arguments;

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
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
                            controller: controller, leads: leads);
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
                      'ID: ${leads.description}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Name: ${leads.name}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Nomor Hp: ${leads.amount}',
                      style: TextStyle(fontSize: 20),
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
  final Leads leads;
  FollowUpDialog({required this.controller, required this.leads});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Follow Up ${leads.name}"),
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
