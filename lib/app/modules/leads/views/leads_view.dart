import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wr_project/app/style/app_color.dart';
import '../controllers/leads_controller.dart';

class LeadsView extends GetView<LeadsController> {
  LeadsView({Key? key}) : super(key: key);

  final List<String> items1 = List.generate(
    20,
    (index) => "Item $index",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leads View'),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'List Leads'),
                Tab(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.input,
                        ),
                        Text(
                          "Input",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: ListView.separated(
                        itemCount: items1.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            color: Colors.grey,
                            thickness: 1.0,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(items1[index]),
                            onTap: () {
                              // Do something when the item is tapped
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Form Input Leads"),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                ),
                                controller: controller.sumD,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Sumber Digital",
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(),
                                  hintText: "",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                controller: controller.sumD,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Sumber Offline",
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(),
                                  hintText: "",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                controller: controller.sumD,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Lokasi Kegiatan",
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(),
                                  hintText: "",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                controller: controller.sumD,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Full Name",
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(),
                                  hintText: "",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                controller: controller.sumD,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Phone Number",
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(),
                                  hintText: "",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                controller: controller.sumD,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Email",
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(),
                                  hintText: "",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                controller: controller.sumD,
                                decoration: InputDecoration(
                                  label: Text(
                                    "NPWP",
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(),
                                  hintText: "",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                controller: controller.sumD,
                                decoration: InputDecoration(
                                  label: Text(
                                    "City",
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(),
                                  hintText: "",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                controller: controller.sumD,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Sales Force",
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(),
                                  hintText: "",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                controller: controller.sumD,
                                decoration: InputDecoration(
                                  label: Text(
                                    "PPU",
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(),
                                  hintText: "",
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColor.primary),
                                    child: Text(
                                      "Submit",
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
