import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: Padding(
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
                  () {
                    if (controller.isFetching.value) {
                      return Center(
                        child: Lottie.asset('asset/animations/loading.json'),
                      );
                    } else if (controller.hasError.value) {
                      return Center(
                        child: Lottie.asset('asset/animations/error.json'),
                      );
                    } else if (controller.filteredApprovals.isEmpty) {
                      return Center(
                        child: Lottie.asset('asset/animations/isEmpty.json'),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: controller.filteredApprovals.length,
                        itemBuilder: (context, index) {
                          final approval = controller.filteredApprovals[index];
                          IconData trailingIcon;
                          Color trailingIconColor = Colors.grey;
                          IconData statusIcon;
                          Color statusIconColor = Colors.grey;
                          Color textColor = Colors.black;

                          switch (approval.property.approvalStatus) {
                            case 'approved':
                              trailingIcon = Icons.check;
                              trailingIconColor = Colors.green;
                              textColor = Colors.green;
                              break;
                            case 'reject':
                              trailingIcon = Icons.close;
                              trailingIconColor = Colors.redAccent;
                              textColor = Colors.redAccent;
                              break;
                            default:
                              trailingIcon = Icons.hourglass_empty;
                              trailingIconColor = Colors.blue;
                              textColor = Colors.grey;
                          }

                          switch (approval.status) {
                            case 'pending':
                              statusIcon = Icons.autorenew;
                              statusIconColor = Colors.grey;
                              break;
                            case 'approved':
                              statusIcon = Icons.done_all;
                              statusIconColor = Colors.green;
                              break;
                            case 'reject':
                              statusIcon = Icons.error;
                              statusIconColor = Colors.red;
                              break;
                            default:
                              statusIcon = Icons.help;
                              statusIconColor = Colors.blue;
                          }

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: ListTile(
                                title: Text(
                                  approval.name,
                                  style: TextStyles.headerapprovalStyleProfile
                                      .copyWith(color: textColor),
                                ),
                                subtitle: Text(approval.property.unitDesc),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      trailingIcon,
                                      color: trailingIconColor,
                                    ),
                                    const SizedBox(width: 10),
                                    Icon(
                                      statusIcon,
                                      color: statusIconColor,
                                    ),
                                  ],
                                ),
                                onTap: () => Get.toNamed(
                                  Routes.DETAIL_APPROVAL,
                                  arguments: approval,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
