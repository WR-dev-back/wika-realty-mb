import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constant/style/app_color.dart';
import '../../../utils/constant/style/text_styles.dart';
import '../controllers/approval_controller.dart';

class ApprovalView extends GetView<ApprovalController> {
  const ApprovalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
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
              decoration: const InputDecoration(
                labelText: 'Search Approval',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                controller.searchApproval(value);
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(
                () => RefreshIndicator(
                  onRefresh: controller.refreshData,
                  child: controller.isFetching.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: controller.filteredApprovals.length,
                          itemBuilder: (context, index) {
                            final approval =
                                controller.filteredApprovals[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: ListTile(
                                  title: Text(
                                    approval.name,
                                    style:
                                        TextStyles.headerapprovalStyleProfile,
                                    // maxLines: 1,
                                  ),
                                  subtitle: Text(approval.property.unitDesc),
                                  onTap: () => Get.toNamed(
                                    Routes.DETAIL_APPROVAL,
                                    arguments: approval,
                                  ),
                                ),
                              ),
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
