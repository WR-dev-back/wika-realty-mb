import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wr_project/app/utils/constant/style/app_color.dart';

import '../../../../common/models/approval.dart';
import '../../../../utils/constant/style/text_styles.dart';
import '../controllers/detail_approval_controller.dart';

class DetailApprovalView extends GetView<DetailApprovalController> {
  const DetailApprovalView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Approval approval = Get.arguments;

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          title: Text(
            'Detail Approval',
            style: TextStyles.titleLabelStyle,
          ),
          centerTitle: true,
          backgroundColor: AppColor.primary,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Column(
                  children: [
                    Card(
                      color: Colors.white,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Customer Name: ${approval.property.customerName}',
                              style: TextStyles.leadsTextStyle,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Unit Description: ${approval.property.unitDesc}',
                              style: TextStyles.leadsTextStyle,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Contract Value: ${approval.property.contractValueNetto}',
                              style: TextStyles.leadsTextStyle,
                            ),
                            // Add more details as needed
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await controller.approve(approval.id);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary,
                      ),
                      child: Text(
                        "Accept",
                        style: TextStyles.cardbuttomTextStyle,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await controller.reject(approval.id);
                      },
                      child: Text("Reject"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
