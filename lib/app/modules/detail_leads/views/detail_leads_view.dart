import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wr_project/app/modules/leads/views/leads_view.dart';

import '../controllers/detail_leads_controller.dart';

class DetailLeadsView extends GetView<DetailLeadsController> {
  DetailLeadsView({Key? key}) : super(key: key);
  final Leads leads = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailLeadsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Name: ${leads.name}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
