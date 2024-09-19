import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wr_project/app/routes/app_pages.dart';
import 'package:wr_project/app/utils/constant/style/app_color.dart';
import 'package:wr_project/app/utils/constant/style/text_styles.dart';

import '../controllers/detail_leads_controller.dart';

class DetailLeadsView extends GetView<DetailLeadsController> {
  DetailLeadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leads = Get.arguments;

    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp.',
      decimalDigits: 0,
    );

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: AppColor.primary,
        title: Text(
          'Detail Leads',
          style: TextStyles.titleLabelStyle.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
<<<<<<< HEAD
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
                                    '${leads?.fullName ?? '-'}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads?.email ?? '-'}',
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
                                height: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nomor Telepon',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads?.phoneNumber ?? '-'}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sumber Digital',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads?.digitalSource ?? '-'}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sumber Offlane',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads?.offlineSource ?? '-'}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),

                              const SizedBox(height: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lokasi Kegiatan',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads?.locationOffline ?? '-'}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'NPWP',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads?.npwp ?? '-'}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kota',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads?.city ?? '-'}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Type',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads?.type ?? '-'}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Area',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
                                    '${leads?.area ?? '-'}',
                                    style: TextStyles.buttonprofileTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Omzet',
                                    style: TextStyles.approvalTextStyle,
                                  ),
                                  Text(
<<<<<<< HEAD
                                    currencyFormat.format(
                                      leads?.omzet != null
                                          ? double.parse(leads!.omzet!)
                                          : 0.0,
                                    ),
=======
                                    leads?.omzet != null
                                        ? currencyFormat.format(
                                            double.parse(leads.omzet),
                                          )
                                        : '-',
>>>>>>> a2f0f05658bbf3ef1d1d8508a574b7a65a350f7c
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
=======
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildInfoCard(
                      icon: Icons.person_outline,
                      title: 'Nama Lengkap',
                      value: leads?.fullName ?? '-',
>>>>>>> c66acc6838ceb7a12c58eacbcb9306960df03734
                    ),
                    SizedBox(height: 10),
                    _buildInfoCard(
                      icon: Icons.email_outlined,
                      title: 'Email',
                      value: leads?.email ?? '-',
                    ),
                    SizedBox(height: 10),
                    _buildInfoCard(
                      icon: Icons.credit_card_outlined,
                      title: 'NPWP',
                      value: leads?.npwp ?? '-',
                    ),
                    SizedBox(height: 10),
                    _buildInfoCard(
                      icon: Icons.phone_android_outlined,
                      title: 'Nomor Telepon',
                      value: leads?.phoneNumber ?? '-',
                    ),
                    SizedBox(height: 10),
                    _buildInfoCard(
                      icon: Icons.public_outlined,
                      title: 'Sumber Digital',
                      value: leads?.digitalSource ?? '-',
                    ),
                    SizedBox(height: 10),
                    _buildInfoCard(
                      icon: Icons.offline_pin_outlined,
                      title: 'Sumber Offline',
                      value: leads?.offlineSource ?? '-',
                    ),
                    SizedBox(height: 10),
                    _buildInfoCard(
                      icon: Icons.location_on_outlined,
                      title: 'Lokasi Kegiatan',
                      value: leads?.locationOffline ?? '-',
                    ),
                    SizedBox(height: 10),
                    _buildInfoCard(
                      icon: Icons.category_outlined,
                      title: 'Type',
                      value: leads?.type ?? '-',
                    ),
                    SizedBox(height: 10),
                    _buildInfoCard(
                      icon: Icons.area_chart_outlined,
                      title: 'Area',
                      value: leads?.area ?? '-',
                    ),
                    SizedBox(height: 10),
                    _buildInfoCard(
                      icon: Icons.attach_money_outlined,
                      title: 'Omzet',
                      value: leads?.omzet != null
                          ? currencyFormat.format(double.parse(
                              leads.omzet.toString())) // Convert int to String
                          : '-',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildActionButtons(leads),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // Card for displaying lead information
  _buildInfoCard(
      {required IconData icon,
      required String title,
      required dynamic value // Accepts both String and int
      }) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: Icon(
                icon,
                size: 28,
                color: AppColor.primary,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.descriptionStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    value?.toString() ?? '-', // Convert value to String
                    style: TextStyles.descriptionStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Action buttons for "Edit" and "Follow Up"
  Widget _buildActionButtons(leads) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 140,
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(
                Routes.EDIT_DETAIL_LEADS,
                arguments: leads,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.error,
              padding: EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: Text(
              "Edit",
              style: TextStyles.cardbuttomTextStyle.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          width: 140,
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(
                Routes.FOLLOWUP_LEADS,
                arguments: leads,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: Text(
              "Follow Up",
              style: TextStyles.cardbuttomTextStyle.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
