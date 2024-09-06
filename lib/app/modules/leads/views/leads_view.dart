import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/constant/style/app_color.dart';
import '../../../utils/constant/style/text_styles.dart';
import '../controllers/leads_controller.dart';

class LeadsView extends GetView<LeadsController> {
  LeadsView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('MMM d, h:mm a');
    return formatter.format(dateTime);
  }

  String formatOmzet(double omzet) {
    if (omzet >= 1000000000) {
      double omzetMiliar = omzet / 1000000000;
      return 'Rp. ${omzetMiliar.toStringAsFixed(0)} Miliar';
    } else if (omzet >= 1000000) {
      double omzetJuta = omzet / 1000000;
      return 'Rp. ${omzetJuta.toStringAsFixed(0)} Juta';
    } else {
      final NumberFormat currencyFormat = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp.',
        decimalDigits: 0,
      );
      return currencyFormat.format(omzet);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54.0), // Adjust the height if needed
        child: Obx(
          () => AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: controller.isSearching.value
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: AppBar(
              leading: const BackButton(
                color: Colors.white,
              ),
              elevation: 0,
              backgroundColor: AppColor.primary,
              title: Text(
                'Leads View',
                style: TextStyles.titleLabelStyle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.isSearching.value = true;
                  },
                ),
              ],
            ),
            secondChild: AppBar(
              backgroundColor: AppColor.primary,
              title: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Leads',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white),
                autofocus: true,
                onChanged: (value) {
                  controller.searchLeads(value);
                },
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  controller.isSearching.value = false;
                },
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: Icon(
                      Icons.filter_list,
                      color: controller.searchType.value != 'fullname'
                          ? Colors.grey
                          : Colors.white,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Filter by'),
                            content: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FilterTile(
                                    title: 'Full Name',
                                    isSelected: controller.searchType.value ==
                                        'fullname',
                                    onTap: () {
                                      controller.searchType.value = 'fullname';
                                      Get.back();
                                    },
                                  ),
                                  FilterTile(
                                    title: 'Code',
                                    isSelected:
                                        controller.searchType.value == 'code',
                                    onTap: () {
                                      controller.searchType.value = 'code';
                                      Get.back();
                                    },
                                  ),
                                  FilterTile(
                                    title: 'Phone Number',
                                    isSelected: controller.searchType.value ==
                                        'phonenumber',
                                    onTap: () {
                                      controller.searchType.value =
                                          'phonenumber';
                                      Get.back();
                                    },
                                  ),
                                  FilterTile(
                                    title: 'Email',
                                    isSelected:
                                        controller.searchType.value == 'email',
                                    onTap: () {
                                      controller.searchType.value = 'email';
                                      Get.back();
                                    },
                                  ),
                                  FilterTile(
                                    title: 'Npwp',
                                    isSelected:
                                        controller.searchType.value == 'npwp',
                                    onTap: () {
                                      controller.searchType.value = 'npwp';
                                      Get.back();
                                    },
                                  ),
                                  FilterTile(
                                    title: 'Kota',
                                    isSelected:
                                        controller.searchType.value == 'city',
                                    onTap: () {
                                      controller.searchType.value = 'city';
                                      Get.back();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  controller.searchType.value =
                                      'fullname'; // Clear the filter
                                  Get.back();
                                },
                                child: Text('Clear Filter'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              color: AppColor.primary, // Match AppBar background color
              child: TabBar(
                labelStyle: TextStyles.decTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                unselectedLabelStyle: TextStyles.decTextStyle,
                indicatorColor:
                    Colors.white, // Color for the active tab indicator
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.list, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          "List Leads",
                          style: TextStyles.decTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.input, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          "Input",
                          style: TextStyles.decTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      children: [
                        SizedBox(height: 5),
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
                                child: ListView.builder(
                                  controller: controller.scrollController,
                                  itemCount: controller.filteredLeads.length,
                                  itemBuilder: (context, index) {
                                    final leads =
                                        controller.filteredLeads[index];

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 16),
                                      child: InkWell(
                                        onTap: () => Get.toNamed(
                                          Routes.DETAIL_LEADS,
                                          arguments: leads,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 2,
                                                blurRadius: 6,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.qr_code_2,
                                                          size: 20,
                                                          color:
                                                              AppColor.primary,
                                                        ),
                                                        SizedBox(width: 12),
                                                        Text(
                                                          leads.leadsCode ??
                                                              '-',
                                                          style: TextStyles
                                                              .headerapprovalStyleProfile
                                                              .copyWith(
                                                            fontSize: 14,
                                                            color: Colors
                                                                .grey[700],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8,
                                                              vertical: 4),
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade200,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Text(
                                                        '${leads.createdAt != null ? formatDateTime(leads.createdAt!) : 'Unknown'}',
                                                        style: TextStyles
                                                            .headerapprovalStyleProfile
                                                            .copyWith(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.grey[700],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 8),
                                                Text(
                                                  leads.fullName ?? '-',
                                                  style: TextStyles
                                                      .headerapprovalStyleProfile
                                                      .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                SizedBox(height: 8),
                                                Divider(
                                                    thickness: 1,
                                                    color:
                                                        Colors.grey.shade300),
                                                SizedBox(height: 8),
                                                _buildInfoRow(
                                                  Icons.email,
                                                  leads.email ?? '-',
                                                  TextStyles
                                                      .headerapprovalStyleProfile
                                                      .copyWith(
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                _buildInfoRow(
                                                  Icons.phone,
                                                  leads.phoneNumber ?? '-',
                                                  TextStyles
                                                      .headerapprovalStyleProfile
                                                      .copyWith(
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                _buildInfoRow(
                                                  Icons.location_city,
                                                  leads.city ?? '-',
                                                  TextStyles
                                                      .headerapprovalStyleProfile
                                                      .copyWith(
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                              ],
                                            ),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      children: [
                        Text(
                          "Form Input Leads",
                          style: TextStyles.approvalTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColor.primary,
                            fontSize: 20,
                          ),
                        ),
                        Divider(
                          height: 10,
                          thickness: 1,
                          color: AppColor.primary.withOpacity(0.5),
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
                          keyboardType: TextInputType.numberWithOptions(),
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
                        SizedBox(height: 20),
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
                                    offlineSource: controller.sumOf.text,
                                    locationOffline: controller.lok.text,
                                    city: controller.cityC.text,
                                    type: controller.typeC.text,
                                    area: int.tryParse(controller.areaC.text) ??
                                        0,
                                    omzet: controller.omzetC.text,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primary,
                                padding: EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: Text(
                                "Submit",
                                style: TextStyles.inputbuttonTextStyle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  )
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
              style: TextStyles.descriptionStyle
                  .copyWith(fontWeight: FontWeight.bold),
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
    // Allow an empty input or an input that starts with "+"
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    // Extract text and filter out non-numeric characters except for the leading "+"
    String newText = newValue.text;
    if (newText.startsWith('+')) {
      newText = '+' + newText.substring(1).replaceAll(RegExp(r'\D'), '');
    } else {
      newText = newText.replaceAll(RegExp(r'\D'), '');
    }

    // Return the updated value with the cursor positioned at the end
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class FilterTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterTile({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: isSelected ? Icon(Icons.check, color: Colors.blue) : null,
      onTap: onTap,
    );
  }
}

Widget _buildInfoRow(IconData icon, String info, TextStyle style) {
  return Row(
    children: [
      Icon(
        icon,
        size: 20,
        color: AppColor.primary,
      ),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          info,
          style: style,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
