import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/utils/constant/style/text_styles.dart';
import '../controllers/followup_leads_controller.dart';

class FollowupLeadsView extends GetView<FollowupLeadsController> {
  const FollowupLeadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leads = Get.arguments as dynamic;

    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Follow Up'),
          bottom: TabBar(
            controller: controller.tabController,
            tabs: [
              Obx(
                () => Tab(
                  text: 'Follow Up 1',
                  icon: Icon(
                    Icons.check_circle,
                    color: controller.followUp1Completed.value
                        ? Colors.green
                        : Colors.grey,
                  ),
                ),
              ),
              Obx(
                () => Tab(
                  text: 'Follow Up 2',
                  icon: Icon(
                    Icons.check_circle,
                    color: controller.followUp2Completed.value
                        ? Colors.green
                        : Colors.grey,
                  ),
                ),
              ),
              Tab(
                text: 'Follow Up 3',
                icon: Icon(
                  Icons.check_circle,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: TabBarView(
            controller: controller.tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              buildFollowUpTab(controller, leads, 1),
              Obx(() => controller.isNextFollowUpTypeEnabled(2)
                  ? buildFollowUpTab(controller, leads, 2)
                  : Center(child: Text('Complete Follow Up 1 first'))),
              Obx(() => controller.isNextFollowUpTypeEnabled(3)
                  ? buildFollowUpTab(controller, leads, 3)
                  : Center(child: Text('Complete Follow Up 2 first'))),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFollowUpTab(
      FollowupLeadsController controller, dynamic leads, int followUpNumber) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20),
        Center(
          child: Text(
            'Follow Up $followUpNumber ${leads?.fullName}',
            style: TextStyles.headerStyle,
          ),
        ),
        SizedBox(height: 10),
        Obx(
          () => TextFormField(
            readOnly: true,
            controller: controller.dateController,
            decoration: InputDecoration(
              hintText: controller.hintText.value,
            ),
            onTap: () => controller.showFollowUpDialog(),
          ),
        ),
        TextField(
          controller: controller.followUpController,
          decoration: InputDecoration(hintText: "Follow Up"),
        ),
        TextField(
          controller: controller.prospectsController,
          decoration: InputDecoration(hintText: "Prospek"),
        ),
        DropdownButtonFormField(
          value: controller.selectedFollowUpOption,
          items: controller.followUpOptions.map((option) {
            return DropdownMenuItem(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: (value) {
            controller.selectedFollowUpOption = value;
          },
          decoration: InputDecoration(
            hintText: 'Status Leads',
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {
              controller.updateFollowUp(
                leads?.id ?? '', // Ensure leads.id is not null
              );
            },
            child: Text('Save'),
          ),
        ),
      ],
    );
  }
}
