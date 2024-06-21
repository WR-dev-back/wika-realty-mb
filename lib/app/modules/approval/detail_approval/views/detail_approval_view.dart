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
      body: SingleChildScrollView(
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
                                'Approval Name',
                                style: TextStyles.approvalTextStyle,
                              ),
                              Text(
                                '${approval.name}',
                                style: TextStyles.buttonprofileTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Unit Description',
                                style: TextStyles.approvalTextStyle,
                              ),
                              Text(
                                '${approval.property.unitDesc}',
                                style: TextStyles.buttonprofileTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
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
                                'Contract Number',
                                style: TextStyles.approvalTextStyle,
                              ),
                              Text(
                                '${approval.property.contractNo}',
                                style: TextStyles.buttonprofileTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Customer Code',
                                style: TextStyles.approvalTextStyle,
                              ),
                              Text(
                                '${approval.property.customerCode}',
                                style: TextStyles.buttonprofileTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Customer Name',
                                style: TextStyles.approvalTextStyle,
                              ),
                              Text(
                                '${approval.property.customerName}',
                                style: TextStyles.buttonprofileTextStyle,
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Unit Code',
                                style: TextStyles.approvalTextStyle,
                              ),
                              Text(
                                '${approval.property.unitCode}',
                                style: TextStyles.buttonprofileTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contract Value Netto',
                                style: TextStyles.approvalTextStyle,
                              ),
                              Text(
                                'Rp.${approval.property.contractValueNetto}',
                                style: TextStyles.buttonprofileTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contract Value Brutto',
                                style: TextStyles.approvalTextStyle,
                              ),
                              Text(
                                'Rp.${approval.property.contractValueBrutto}',
                                style: TextStyles.buttonprofileTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Booking Fee Brutto',
                                style: TextStyles.approvalTextStyle,
                              ),
                              Text(
                                'Rp.${approval.property.bookingFeeBruto}',
                                style: TextStyles.buttonprofileTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Booking Fee Netto',
                                style: TextStyles.approvalTextStyle,
                              ),
                              Text(
                                'Rp.${approval.property.bookingFeeNetto}',
                                style: TextStyles.buttonprofileTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Progress Count',
                                style: TextStyles.approvalTextStyle,
                              ),
                              Text(
                                '${approval.property.progressConst}',
                                style: TextStyles.buttonprofileTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cancel Date',
                                style: TextStyles.approvalTextStyle,
                              ),
                              Text(
                                '${approval.property.cancelDate}',
                                style: TextStyles.buttonprofileTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Refund Recomendation',
                                style: TextStyles.approvalTextStyle,
                              ),
                              Text(
                                '${approval.property.refundRecommendation ?? '-'}',
                                style: TextStyles.buttonprofileTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ri Refund',
                                style: TextStyles.approvalTextStyle,
                              ),
                              Text(
                                '${approval.property.riRefound}',
                                style: TextStyles.buttonprofileTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Recommendation Value',
                                style: TextStyles.approvalTextStyle,
                              ),
                              Text(
                                '${approval.property.recommendationValue ?? '-'}',
                                style: TextStyles.buttonprofileTextStyle,
                              ),
                            ],
                          ),
                          // Add more details as needed
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => controller.approvalStatus.value == 'pending'
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 130,
                              child: ElevatedButton(
                                onPressed: () async {
                                  _showConfirmationDialog(
                                    context,
                                    "Are you sure you want to Reject this item?",
                                    () async {
                                      await controller.reject(approval.id);
                                      Get.back();
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.error,
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.cancel,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Reject",
                                        style: TextStyles.cardbuttomTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 140,
                              child: ElevatedButton(
                                onPressed: () async {
                                  _showConfirmationDialog(
                                    context,
                                    "Are you sure you want to Approve this item?",
                                    () async {
                                      await controller.approve(approval.id);
                                      Get.back();
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Approve",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(height: 0),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(
      BuildContext context, String message, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmation"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: onConfirm,
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }
}
