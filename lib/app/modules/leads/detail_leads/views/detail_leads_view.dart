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
          'Detail Leads View',
          style: TextStyles.titleLabelStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[300],
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey[
                                              300], // Warna latar belakang lingkaran
                                        ),
                                        child: Icon(
                                          Icons.person_outline,
                                          size: 25,
                                          color: AppColor.primary, // Warna ikon
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${leads?.fullName ?? '-'}',
                                          style: TextStyles.headStyle.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Email',
                                        style: TextStyles.descriptionStyle
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${leads?.email ?? '-'}',
                                        style: TextStyles.descriptionStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'NPWP',
                                      style: TextStyles.descriptionStyle
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${leads?.npwp ?? '-'}',
                                      style: TextStyles.descriptionStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nomor Telepon',
                                      style: TextStyles.descriptionStyle
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${leads?.phoneNumber ?? '-'}',
                                      style: TextStyles.descriptionStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sumber Digital',
                                      style: TextStyles.descriptionStyle
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${leads?.digitalSource ?? '-'}',
                                      style: TextStyles.descriptionStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sumber Offline',
                                      style: TextStyles.descriptionStyle
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${leads?.offlineSource ?? '-'}',
                                      style: TextStyles.descriptionStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Lokasi Kegiatan',
                                      style: TextStyles.descriptionStyle
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${leads?.locationOffline ?? '-'}',
                                      style: TextStyles.descriptionStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Lokasi Kegiatan',
                                      style: TextStyles.descriptionStyle
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${leads?.locationOffline ?? '-'}',
                                      style: TextStyles.descriptionStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Type',
                                      style: TextStyles.descriptionStyle
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${leads?.type ?? '-'}',
                                      style: TextStyles.descriptionStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Area',
                                      style: TextStyles.descriptionStyle
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${leads?.area ?? '-'}',
                                      style: TextStyles.descriptionStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Omzet',
                                      style: TextStyles.descriptionStyle
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      leads?.omzet != null
                                          ? currencyFormat.format(
                                              double.parse(leads.omzet),
                                            )
                                          : '-',
                                      style: TextStyles.descriptionStyle,
                                    ),
                                  ],
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
            ),
            Row(
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
                    ),
                    child: Text(
                      "Edit",
                      style: TextStyles.cardbuttomTextStyle,
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
                    ),
                    child: Text(
                      "Follow Up",
                      style: TextStyles.cardbuttomTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
