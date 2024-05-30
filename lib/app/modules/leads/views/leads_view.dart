import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wr_project/app/common/model/leads.dart';
import 'package:wr_project/app/modules/leads/controllers/leads_controller.dart';
import 'package:wr_project/app/routes/app_pages.dart';
import 'package:wr_project/app/utils/constant/style/app_color.dart';

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
                            onSubmitted: (value) {
                              controller.searchLeads(value);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Obx(() {
                              if (controller.isFetching.value) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else {
                                List<Datum> leads = controller.filteredLeads;
                                return ListView.builder(
                                    itemCount: leads.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                              leads[index].fullName,
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      fontSize: 20),
                                            ),
                                            subtitle: Text(
                                              leads[index].email,
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      fontSize: 14),
                                            ),
                                            trailing: Text(
                                              leads[index].phoneNumber,
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      fontSize: 14),
                                            ),
                                            onTap: () => Get.toNamed(
                                              Routes.DETAIL_LEADS,
                                              arguments: leads[index],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              }
                            }),
                          )
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
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(15),
                                  PhoneNumberFormatter(),
                                ],
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
                                controller: controller.typeC,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Type",
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
                                controller: controller.areaC,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Area",
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
                                controller: controller.omzetC,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Omzet",
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
                                    onPressed: () async {
                                      await controller.postDataToBackend(
                                        email: controller.email.text,
                                        fullName: controller.fullName.text,
                                        phoneNumber: controller.phoneNum.text,
                                        npwp: controller.npwpC.text,
                                        digitalSource: controller.sumD.text,
                                        offlineSource: controller.sumOf.text,
                                        locationOffline: controller.lok.text,
                                        city: controller.cityC.text,
                                        type: controller.typeC.text,
                                        area: int.tryParse(
                                                controller.areaC.text) ??
                                            0,
                                        omzet: int.tryParse(
                                                controller.omzetC.text) ??
                                            0,
                                      );
                                    },
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

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Add '+' if the length is less than or equal to 1
    if (newValue.text.length <= 1) {
      return TextEditingValue(
        text: '+${newValue.text}',
        selection: TextSelection.collapsed(offset: newValue.text.length + 1),
      );
    }
    return newValue;
  }
}
