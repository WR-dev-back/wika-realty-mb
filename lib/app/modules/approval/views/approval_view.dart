import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/routes/app_pages.dart';

import '../../../utils/constant/style/app_color.dart';
import '../../../utils/constant/style/text_styles.dart';
import '../controllers/approval_controller.dart';

// Model untuk Lead
class Approval {
  final String nomer;
  final String fullName;
  final String email;
  final String phoneNumber;

  Approval({
    required this.nomer,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
  });
}

// Data dummy
final List<Approval> dummyApproval = [
  Approval(
      nomer: '822',
      fullName: 'John Doe',
      email: 'john@example.com',
      phoneNumber: '1234567890'),
  Approval(
      nomer: '823',
      fullName: 'Jane Smith',
      email: 'jane@example.com',
      phoneNumber: '0987654321'),
  Approval(
      nomer: '824',
      fullName: 'Alice Johnson',
      email: 'alice@example.com',
      phoneNumber: '1122334455'),
  Approval(
      nomer: '825',
      fullName: 'Bob Brown',
      email: 'bob@example.com',
      phoneNumber: '2233445566'),
];

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
              child: ListView.builder(
                itemCount: dummyApproval.length,
                itemBuilder: (context, index) {
                  final approval = dummyApproval[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        leading: Text(
                          approval.nomer,
                          style: TextStyles.headStyle,
                        ),
                        title: Text(
                          approval.fullName,
                          style: TextStyles.headStyle,
                        ),
                        subtitle: Text(
                          approval.email,
                          style: TextStyles.decTextStyle,
                        ),
                        trailing: Text(
                          approval.phoneNumber,
                          style: TextStyles.decTextStyle,
                        ),
                        onTap: () {
                          // Handle item tap
                          Get.toNamed(Routes.DETAIL_APPROVAL,
                              arguments: approval);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
