import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wr_project/app/model/leads.dart';
import 'package:wr_project/app/modules/leads/controllers/leads_controller.dart';
import 'package:wr_project/app/routes/app_pages.dart';
import 'package:wr_project/app/style/app_color.dart';

class LeadsView extends GetView<LeadsController> {
  LeadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text(
          'Leads View',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      child: Column(
                        children: [
                          TextField(
                            controller: controller.searchController,
                            decoration: InputDecoration(
                              labelText: 'Search Leads',
                              prefixIcon: Icon(Icons.search),
                            ),
                            onChanged: (value) {
                              controller.filterLeads(value);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FutureBuilder<List<Datum>>(
                              future: controller.fetchDataLeads(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text("error : ${snapshot.error}"));
                                } else {
                                  List<Datum> leads = controller.filteredLeads;
                                  return Expanded(
                                    child: ListView.builder(
                                      itemCount: leads.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 8,
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            child: ListTile(
                                              title: Text(
                                                leads[index].fullName,
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              subtitle: Text(
                                                leads[index].email,
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              trailing: Text(
                                                leads[index].phoneNumber,
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                  textStyle: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                              onTap: () => Get.toNamed(
                                                Routes.DETAIL_LEADS,
                                                arguments: leads[index],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }
                              })
                        ],
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
