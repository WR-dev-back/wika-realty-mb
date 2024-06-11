import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constant/style/app_color.dart';
import '../../../utils/constant/style/text_styles.dart';
import '../controllers/approval_controller.dart';

class ApprovalView extends GetView<ApprovalController> {
  const ApprovalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: AppColor.primary,
        title: Text(
          'Approval View',
          style: TextStyles.titleLabelStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Search Approval',
                prefixIcon: Icon(Icons.search),
              ),
              onSubmitted: (value) {
                // Add search functionality here
              },
            ),
            SizedBox(height: 10),
            Expanded(
              child: Obx(
                () => RefreshIndicator(
                  onRefresh: controller.refreshData,
                  child: controller.isFetching.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: controller.approvals.length,
                          itemBuilder: (context, index) {
                            final approval = controller.approvals[index];
                            return ExpansionTile(
                              title: Text(approval.name),
                              subtitle: Text(approval.costProfitCenter),
                              children: approval.list.map((listElement) {
                                return ListTile(
                                  title: Text(listElement.name),
                                  subtitle: Text(
                                      'Min Omzet: ${listElement.minOmzet}, Max Omzet: ${listElement.maxOmzet}'),
                                  // trailing: Column(
                                  //   crossAxisAlignment: CrossAxisAlignment.end,
                                  //   children: listElement.approvalDetails
                                  //       .map((detail) {
                                  //     return Text(
                                  //         'Detail ID: ${detail.createdAt}');
                                  //   }).toList(),
                                  // ),
                                );
                              }).toList(),
                            );
                          },
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
