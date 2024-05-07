import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/approval_controller.dart';

class ApprovalView extends GetView<ApprovalController> {
  const ApprovalView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ApprovalView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ApprovalView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
