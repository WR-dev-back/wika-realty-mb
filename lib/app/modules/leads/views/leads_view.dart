import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/model/leads.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constant/style/app_color.dart';
import '../../../utils/constant/style/text_styles.dart';
import '../controllers/leads_controller.dart';

class LeadsView extends GetView<LeadsController> {
  LeadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LeadsController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text(
          'Leads View',
          style: TextStyles.fieldLabelStyle,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.input),
                      Text(
                        "Input",
                        style: TextStyles.decTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        SizedBox(height: 10),
                        Expanded(
                          child: Obx(() {
                            if (controller.isFetching.value) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              List<Datum> leads = controller.filteredLeads;
                              return ListView.builder(
                                itemCount: leads.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          leads[index].fullName,
                                          style: TextStyles.headStyle,
                                        ),
                                        subtitle: Text(
                                          leads[index].email,
                                          style: TextStyles.decTextStyle,
                                        ),
                                        trailing: Text(
                                          leads[index].phoneNumber,
                                          style: TextStyles.decTextStyle,
                                        ),
                                        onTap: () => Get.toNamed(
                                          Routes.DETAIL_LEADS,
                                          arguments: leads[index],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          }),
                        ),
                      ],
                    ),
                  ),
                  ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Form Input Leads"),
                              SizedBox(height: 20),
                              _buildTextField(
                                  controller.sumD, "Sumber Digital"),
                              SizedBox(height: 20),
                              _buildTextField(
                                  controller.sumOf, "Sumber Offline"),
                              SizedBox(height: 20),
                              _buildTextField(
                                  controller.lok, "Lokasi Kegiatan"),
                              SizedBox(height: 20),
                              _buildTextField(controller.fullName, "Full Name"),
                              SizedBox(height: 20),
                              _buildTextField(
                                controller.phone,
                                "Phone Number",
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(15),
                                  PhoneNumberFormatter(),
                                ],
                              ),
                              SizedBox(height: 20),
                              _buildTextField(controller.npwpC, "Npwp",
                                  keyboardType:
                                      TextInputType.numberWithOptions()),
                              SizedBox(height: 20),
                              _buildTextField(controller.email, "Email"),
                              SizedBox(height: 20),
                              _buildTextField(controller.cityC, "City"),
                              SizedBox(height: 20),
                              _buildTextField(controller.typeC, "Type"),
                              SizedBox(height: 20),
                              _buildTextField(controller.areaC, "Area"),
                              SizedBox(height: 20),
                              _buildTextField(controller.omzetC, "Omzet"),
                              SizedBox(height: 10),
                              Center(
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await controller.postDataToBackend(
                                        email: controller.email.text,
                                        fullName: controller.fullName.text,
                                        phone: controller.phone.text,
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
                                      style: TextStyles.decTextStyle,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
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

  Widget _buildTextField(TextEditingController controller, String labelText,
      {TextInputType keyboardType = TextInputType.text,
      List<TextInputFormatter>? inputFormatters}) {
    return TextFormField(
      style: TextStyles.decTextStyle,
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        label: Text(
          labelText,
          style: GoogleFonts.plusJakartaSans(fontSize: 20, color: Colors.black),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(),
        hintText: "",
      ),
    );
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    String newText =
        newValue.text.startsWith('+') ? newValue.text : '+${newValue.text}';
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
