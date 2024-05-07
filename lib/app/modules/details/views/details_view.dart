import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wr_project/app/model/body.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  final Menu menu = Get.arguments;
  DetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${menu.name}'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
