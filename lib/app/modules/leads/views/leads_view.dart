import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wr_project/app/routes/app_pages.dart';
import 'package:wr_project/app/style/app_color.dart';
import '../controllers/leads_controller.dart';

class LeadsView extends GetView<LeadsController> {
  LeadsView({Key? key}) : super(key: key);

  final List<Leads> leadslist = [
    Leads(
      name: "Pak Didik",
      description: "L00000005648",
      amount: "08566545456",
    ),
    Leads(
      name: "Kevin",
      description: "L00000005678",
      amount: "08164864848",
    ),
    Leads(
      name: "Dawam",
      description: "L00000005789",
      amount: "085608783675",
    ),
  ];

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
                  RefreshIndicator(
                    onRefresh: controller.refreshData,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: ListView.builder(
                          itemCount: leadslist.length,
                          itemBuilder: (BuildContext context, int index) {
                            Leads leads = leadslist[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: ListTile(
                                  title: Text(
                                    leads.name,
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 20,
                                    ),
                                  ),
                                  subtitle: Text(
                                    leads.description,
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 14,
                                    ),
                                  ),
                                  trailing: Text(
                                    leads.amount,
                                    style: GoogleFonts.plusJakartaSans(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  onTap: () => Get.toNamed(Routes.DETAIL_LEADS,
                                      arguments: leads),
                                ),
                              ),
                            );
                          },
                        ),
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
                                controller: controller.sumOf,
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
                                controller: controller.lok,
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
                                controller: controller.fullName,
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
                                controller: controller.phoneNum,
                                keyboardType: TextInputType.number,
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
                                controller: controller.email,
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
                                controller: controller.npwpC,
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
                                controller: controller.cityC,
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
                                controller: controller.salesF,
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
                                controller: controller.ppuC,
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

class Leads {
  final String name;
  final String description;
  final String amount;

  Leads({required this.name, required this.description, required this.amount});
}
