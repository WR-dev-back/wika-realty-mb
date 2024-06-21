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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () async {
                        Get.toNamed(
                          Routes.EDIT_DETAIL_LEADS,
                          arguments: leads,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4B70F5),
                      ),
                      child: Center(
                        child: Text(
                          "Edit",
                          style: TextStyles.btnLabelStyle,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
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
                        backgroundColor: Color(0xFF4B70F5),
                      ),
                      child: Center(
                        child: Text(
                          "Follow Up",
                          style: TextStyles.btnLabelStyle,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${leads.fullName ?? "-"}',
                            style: TextStyles.buttonprofileTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyles.approvalTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${leads?.email}',
                            style: TextStyles.buttonprofileTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nomor Telepon',
                            style: TextStyles.approvalTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${leads?.phoneNumber}',
                            style: TextStyles.buttonprofileTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sumber Digital',
                            style: TextStyles.approvalTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${leads?.digitalSource}',
                            style: TextStyles.buttonprofileTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sumber Offline',
                            style: TextStyles.approvalTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${leads.offlineSource}',
                            style: TextStyles.buttonprofileTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lokasi Kegiatan',
                            style: TextStyles.approvalTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${leads?.locationOffline}',
                            style: TextStyles.buttonprofileTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NPWP',
                            style: TextStyles.approvalTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${leads?.npwp}',
                            style: TextStyles.buttonprofileTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kota',
                            style: TextStyles.approvalTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${leads?.city}',
                            style: TextStyles.buttonprofileTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Type',
                            style: TextStyles.approvalTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${leads?.type}',
                            style: TextStyles.buttonprofileTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Area',
                            style: TextStyles.approvalTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${leads?.area}',
                            style: TextStyles.buttonprofileTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Omzet',
                            style: TextStyles.approvalTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${leads?.omzet}',
                            style: TextStyles.buttonprofileTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
//          floatingActionButton: FloatingActionButton(
//           backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
//           onPressed: (){},
//           mini: true,
//           child: const Icon(Icons.add, color: Colors.white, size: 25),
//  ),
      ),
    );
  }
}
