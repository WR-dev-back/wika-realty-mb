import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/constant/style/app_color.dart';
import '../../../utils/constant/style/text_styles.dart';
import '../controllers/leads_controller.dart';

class LeadsView extends GetView<LeadsController> {
  LeadsView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: AppColor.primary,
        title: Text(
          'Leads View',
          style: TextStyles.titleLabelStyle,
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.list),
                      Text(
                        "List Leads",
                        style: TextStyles.decTextStyle,
                      ),
                    ],
                  ),
                ),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: controller.searchController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Search Leads',
                                  prefixIcon: Icon(Icons.search),
                                ),
                                onSubmitted: (value) {
                                  controller.searchLeads(value);
                                },
                              ),
                            ),
                            SizedBox(width: 20),
                            Obx(
                              () {
                                return IconButton(
                                  icon: Icon(
                                    Icons.filter_list,
                                    color: controller.searchType.value != 'none'
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Filter by'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              FilterTile(
                                                title: 'Full Name',
                                                isSelected: controller
                                                        .searchType.value ==
                                                    'fullname',
                                                onTap: () {
                                                  controller.searchType.value =
                                                      'fullname';
                                                  Get.back();
                                                },
                                              ),
                                              FilterTile(
                                                title: 'Code',
                                                isSelected: controller
                                                        .searchType.value ==
                                                    'code',
                                                onTap: () {
                                                  controller.searchType.value =
                                                      'code';
                                                  Get.back();
                                                },
                                              ),
                                              FilterTile(
                                                title: 'Phone Number',
                                                isSelected: controller
                                                        .searchType.value ==
                                                    'phonenumber',
                                                onTap: () {
                                                  controller.searchType.value =
                                                      'phonenumber';
                                                  Get.back();
                                                },
                                              ),
                                              FilterTile(
                                                title: 'Email',
                                                isSelected: controller
                                                        .searchType.value ==
                                                    'email',
                                                onTap: () {
                                                  controller.searchType.value =
                                                      'email';
                                                  Get.back();
                                                },
                                              ),
                                              FilterTile(
                                                title: 'Npwp',
                                                isSelected: controller
                                                        .searchType.value ==
                                                    'npwp',
                                                onTap: () {
                                                  controller.searchType.value =
                                                      'npwp';
                                                  Get.back();
                                                },
                                              ),
                                              FilterTile(
                                                title: 'Kota',
                                                isSelected: controller
                                                        .searchType.value ==
                                                    'city',
                                                onTap: () {
                                                  controller.searchType.value =
                                                      'city';
                                                  Get.back();
                                                },
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                controller.searchType.value =
                                                    'none'; // Clear the filter
                                                Get.back();
                                              },
                                              child: Text('Clear Filter'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Obx(() {
                            if (controller.isFetching.value) {
                              return Center(
                                child: Lottie.asset(
                                    'asset/animations/loading.json'),
                              );
                            } else if (controller.hasError.value) {
                              return Center(
                                child: Lottie.asset(
                                    'asset/animations/no_network.json'),
                              );
                            } else if (controller.filteredLeads.isEmpty) {
                              return Center(
                                child: Lottie.asset(
                                    'asset/animations/isEmpty.json'),
                              );
                            } else {
                              return RefreshIndicator(
                                onRefresh: controller.refreshData,
                                child: controller.isFetching.value &&
                                        controller.currentPage.value == 1
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : ListView.builder(
                                        controller: controller.scrollController,
                                        itemCount:
                                            controller.filteredLeads.length,
                                        itemBuilder: (context, index) {
                                          final leads =
                                              controller.filteredLeads[index];
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8),
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
                                                  leads.fullName,
                                                  style: TextStyles.headStyle,
                                                  maxLines: 1,
                                                ),
                                                subtitle: Text(
                                                  leads.email,
                                                  style:
                                                      TextStyles.decTextStyle,
                                                  maxLines: 1,
                                                ),
                                                trailing: Text(
                                                  leads.phoneNumber,
                                                  style:
                                                      TextStyles.decTextStyle,
                                                  maxLines: 1,
                                                ),
                                                onTap: () => Get.toNamed(
                                                  Routes.DETAIL_LEADS,
                                                  arguments: leads,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              );
                            }
                          }),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Form Input Leads",
                                  style: TextStyles.approvalTextStyle,
                                ),
                                Divider(
                                  height: 10,
                                  thickness: 1,
                                ),
                                SizedBox(height: 20),
                                _buildTextFieldWithCounter(
                                  controller.sumD,
                                  "Sumber Digital",
                                  50,
                                  controller.digitalSourceCount,
                                ),
                                SizedBox(height: 20),
                                _buildTextFieldWithCounter(
                                  controller.sumOf,
                                  "Sumber Offline",
                                  50,
                                  controller.offlineSourceCount,
                                ),
                                SizedBox(height: 20),
                                _buildTextFieldWithCounter(
                                  controller.lok,
                                  "Lokasi Kegiatan",
                                  100,
                                  controller.locationCount,
                                ),
                                SizedBox(height: 20),
                                _buildTextFieldWithCounter(
                                  controller.fullName,
                                  "Full Name",
                                  100,
                                  controller.fullNameCount,
                                  validator: controller.validateFullName,
                                ),
                                SizedBox(height: 20),
                                _buildTextFieldWithCounter(
                                  controller.phone,
                                  "Phone Number",
                                  15,
                                  controller.phoneCount,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    PhoneNumberFormatter(),
                                  ],
                                  validator: controller.validatePhoneNumber,
                                ),
                                SizedBox(height: 20),
                                _buildTextFieldWithCounter(
                                  controller.npwpC,
                                  "Npwp",
                                  20,
                                  controller.npwpCount,
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
                                ),
                                SizedBox(height: 20),
                                _buildTextFieldWithCounter(
                                  controller.email,
                                  "Email",
                                  100,
                                  controller.emailCount,
                                ),
                                SizedBox(height: 20),
                                _buildTextFieldWithCounter(
                                  controller.cityC,
                                  "City",
                                  50,
                                  controller.cityCount,
                                ),
                                SizedBox(height: 20),
                                _buildTextFieldWithCounter(
                                  controller.typeC,
                                  "Type",
                                  50,
                                  controller.typeCount,
                                ),
                                SizedBox(height: 20),
                                _buildTextFieldWithCounter(
                                  controller.areaC,
                                  "Area",
                                  10,
                                  controller.areaCount,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                                SizedBox(height: 20),
                                _buildTextFieldWithCounter(
                                  controller.omzetC,
                                  "Omzet",
                                  20,
                                  controller.omzetCount,
                                ),
                                SizedBox(height: 10),
                                Center(
                                  child: Container(
                                    width: 150,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          await controller.postDataToBackend(
                                            email: controller.email.text,
                                            fullName: controller.fullName.text,
                                            phone: controller.phone.text,
                                            npwp: controller.npwpC.text,
                                            digitalSource: controller.sumD.text,
                                            offlineSource:
                                                controller.sumOf.text,
                                            locationOffline:
                                                controller.lok.text,
                                            city: controller.cityC.text,
                                            type: controller.typeC.text,
                                            area: int.tryParse(
                                                    controller.areaC.text) ??
                                                0,
                                            omzet: controller.omzetC.text,
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColor.primary),
                                      child: Text(
                                        "Submit",
                                        style: TextStyles.inputbuttonTextStyle,
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithCounter(TextEditingController controller,
      String labelText, int maxLength, RxInt counter,
      {TextInputType keyboardType = TextInputType.text,
      List<TextInputFormatter>? inputFormatters,
      String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: TextStyles.buttonprofileTextStyle,
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: [
            ...?inputFormatters,
            LengthLimitingTextInputFormatter(maxLength),
          ],
          decoration: InputDecoration(
            label: Text(
              labelText,
              style: TextStyles.approvalTextStyle,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: "",
          ),
          validator: validator,
          onChanged: (value) {
            // update character count in controller
            this.controller.updateCount(counter, value);
          },
        ),
        SizedBox(height: 5),
        Obx(() => Text(
              '${counter.value}/$maxLength',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            )),
      ],
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

class FilterTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  FilterTile(
      {required this.title, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: isSelected ? Icon(Icons.check, color: Colors.blue) : null,
      onTap: onTap,
    );
  }
}
