import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wr_project/app/routes/app_pages.dart';
import 'package:wr_project/app/utils/constant/style/app_color.dart';

import '../../../../utils/constant/style/text_styles.dart';
import '../controllers/detail_leads_controller.dart';

class DetailLeadsView extends GetView<DetailLeadsController> {
  DetailLeadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leads = Get.arguments;

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    Get.toNamed(
                      Routes.EDIT_DETAIL_LEADS,
                      arguments: leads,
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.edit),
                      Text(
                        "Edit",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(
                      Routes.FOLLOWUP_LEADS,
                      arguments: leads,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.follow_the_signs,
                        color: Colors.white,
                      ),
                      Text(
                        "Follow Up",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Full Name: ${leads?.fullName}',
                        style: TextStyles.leadsTextStyle,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Email: ${leads?.email}',
                        style: TextStyles.leadsTextStyle,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Phone Number: ${leads?.phoneNumber}',
                        style: TextStyles.leadsTextStyle,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Sumber Digital: ${leads?.digitalSource}',
                        style: TextStyles.leadsTextStyle,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Sumber Offline: ${leads?.offlineSource}',
                        style: TextStyles.leadsTextStyle,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Lokasi Kegiatan: ${leads?.locationOffline}',
                        style: TextStyles.leadsTextStyle,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Npwp: ${leads?.npwp}',
                        style: TextStyles.leadsTextStyle,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'City: ${leads?.city}',
                        style: TextStyles.leadsTextStyle,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Type: ${leads?.type}',
                        style: TextStyles.leadsTextStyle,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Area: ${leads?.area}',
                        style: TextStyles.leadsTextStyle,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Omzet: ${leads?.omzet}',
                        style: TextStyles.leadsTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
