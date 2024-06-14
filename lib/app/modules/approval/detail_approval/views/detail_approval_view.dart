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
        leading: const BackButton(
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
                              'Approval Name',
                              style: TextStyles.headerStyleProfile,
                            ),
                            Text(
                              '${approval.name}',
                              style: TextStyles.approvalTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contract Nomor',
                              style: TextStyles.headerStyleProfile,
                            ),
                            Text(
                              '${approval.property.contractNo}',
                              style: TextStyles.approvalTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Customer Code',
                              style: TextStyles.headerStyleProfile,
                            ),
                            Text(
                              '${approval.property.customerCode}',
                              style: TextStyles.approvalTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Customer Name',
                              style: TextStyles.headerStyleProfile,
                            ),
                            Text(
                              '${approval.property.customerName}',
                              style: TextStyles.approvalTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Unit Description',
                              style: TextStyles.headerStyleProfile,
                            ),
                            Text(
                              '${approval.property.unitDesc}',
                              style: TextStyles.approvalTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contract Value',
                              style: TextStyles.headerStyleProfile,
                            ),
                            Text(
                              '${approval.property.contractValueBrutto}',
                              style: TextStyles.approvalTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Progress Count',
                              style: TextStyles.headerStyleProfile,
                            ),
                            Text(
                              '${approval.property.progressConst}',
                              style: TextStyles.approvalTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Add more details as needed
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (approval.status == 'pending') // Check if the status is pending
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
                      child: const Text("Reject"),
                    ),
                  ],
                ),
              )
            else
              Container(height: 0),
          ],
        ),
      ),
    );
  }
}
