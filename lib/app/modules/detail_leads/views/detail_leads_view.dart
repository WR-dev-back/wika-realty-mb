import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wr_project/app/modules/leads/views/leads_view.dart';
import 'package:wr_project/app/style/app_color.dart';

import '../controllers/detail_leads_controller.dart';

class DetailLeadsView extends GetView<DetailLeadsController> {
  DetailLeadsView({Key? key}) : super(key: key);
  final Leads leads = Get.arguments;

  void _showFollowUpDialog(BuildContext context) {
    TextEditingController _textFieldController1 = TextEditingController();
    TextEditingController _textFieldController2 = TextEditingController();
    TextEditingController _textFieldController3 = TextEditingController();
    TextEditingController _textFieldController4 = TextEditingController();
    TextEditingController _textFieldController5 = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Follow Up"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _textFieldController1,
                decoration: InputDecoration(hintText: "Follow-up 1"),
              ),
              TextField(
                controller: _textFieldController2,
                decoration: InputDecoration(hintText: "Follow-up 2"),
              ),
              TextField(
                controller: _textFieldController3,
                decoration: InputDecoration(hintText: "Follow-up 3"),
              ),
              TextField(
                controller: _textFieldController4,
                decoration: InputDecoration(hintText: "Follow-up 4"),
              ),
              TextField(
                controller: _textFieldController5,
                decoration: InputDecoration(hintText: "Follow-up 5"),
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
                String followUpText1 = _textFieldController1.text;
                String followUpText2 = _textFieldController2.text;
                String followUpText3 = _textFieldController3.text;
                String followUpText4 = _textFieldController4.text;
                String followUpText5 = _textFieldController5.text;

                print("Follow-up 1: $followUpText1");
                print("Follow-up 2: $followUpText2");
                print("Follow-up 3: $followUpText3");
                print("Follow-up 4: $followUpText4");
                print("Follow-up 5: $followUpText5");

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailLeadsView'),
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
                    _showFollowUpDialog(context);
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
                      'Name: ${leads.name}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'ID: ${leads.description}',
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
