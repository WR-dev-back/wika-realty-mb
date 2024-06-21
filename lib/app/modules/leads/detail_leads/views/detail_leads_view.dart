import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wr_project/app/routes/app_pages.dart';
import 'package:wr_project/app/utils/constant/style/app_color.dart';

import '../../../../utils/constant/style/text_styles.dart';
import '../controllers/detail_leads_controller.dart';

class DetailLeadsView extends GetView<DetailLeadsController> {
  DetailLeadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leads = Get.arguments;
    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'id_ID', // Indonesian locale
      symbol: 'Rp.', // Currency symbol
      decimalDigits: 0, // Number of decimal digits
    );

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: AppColor.primary,
        title: Text(
          'Detail Leads View',
          style: TextStyles.titleLabelStyle,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nama Panjang',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads?.fullName}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads.email}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  // Text(
                                  //   "Property Details",
                                  //   style: TextStyles.approvalTextStyle,
                                  // ),
                                  // SizedBox(
                                  //   height: 5,
                                  // ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey,
                                height: 1,
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nomor Telepon',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads.phoneNumber}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sumber Digital',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads.digitalSource}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sumber Offlane',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads.offlineSource}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lokasi Kegiatan',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads.locationOffline}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'NPWP',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads.npwp}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kota',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads.city}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Type',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads.type ?? '-'}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Area',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads.area}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Omzet',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    currencyFormat.format(
                                      leads?.omzet != null
                                          ? double.parse(leads!.omzet!)
                                          : 0.0,
                                    ),
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 70,
                              ),
                              // Add more details as needed
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 630,
              left: 5,
              right: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(
                            Routes.EDIT_DETAIL_LEADS,
                            arguments: leads,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.error,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Edit",
                              style: TextStyles.cardbuttomTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(
                            Routes.FOLLOWUP_LEADS,
                            arguments: leads,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Follow Up",
                              style: TextStyles.cardbuttomTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
