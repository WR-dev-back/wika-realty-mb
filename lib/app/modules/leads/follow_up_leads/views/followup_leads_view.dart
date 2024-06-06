import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/followup_leads_controller.dart';

class FollowupLeadsView extends GetView<FollowupLeadsController> {
  const FollowupLeadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leads = Get.arguments as dynamic;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Follow Up'),
          bottom: TabBar(
            controller: controller.tabController,
            tabs: [
              Obx(() => FollowUpTab(
                    text: 'Follow Up 1',
                    completed: controller.followUp1Completed.value,
                  )),
              Obx(() => FollowUpTab(
                    text: 'Follow Up 2',
                    completed: controller.followUp2Completed.value,
                  )),
              Obx(() => FollowUpTab(
                    text: 'Follow Up 3',
                    completed: controller.isNextFollowUpTypeEnabled(3),
                  )),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TabBarView(
            controller: controller.tabController,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          'Follow Up $followUpNumber ${leads?.fullName}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Obx(() => TextFormField(
              readOnly: true,
              controller: controller.dateController,
              decoration: InputDecoration(
                hintText: controller.hintText.value,
              ),
              onTap: () => controller.showFollowUpDialog(),
            )),
        TextField(
          controller: controller.followUpController,
          decoration: InputDecoration(hintText: "Follow Up"),
        ),
        TextField(
          controller: controller.prospectsController,
          decoration: InputDecoration(hintText: "Prospects"),
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
            controller.validateForm(); // Re-validate form when option changes
          },
          decoration: InputDecoration(
            hintText: 'Status Leads',
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Obx(() => ElevatedButton(
                onPressed: controller.isFormValid.value
                    ? () {
                        controller.updateFollowUp(
                          leads?.id ?? '', // Ensure leads.id is not null
                        );
                      }
                    : null,
                child: Text('Save'),
              )),
        ),
      ],
    );
  }
}

class FollowUpTab extends StatelessWidget {
  final String text;
  final bool completed;

  const FollowUpTab({
    Key? key,
    required this.text,
    required this.completed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: text,
      icon: Icon(
        Icons.check_circle,
        color: completed ? Colors.green : Colors.grey,
      ),
    );
  }
}
