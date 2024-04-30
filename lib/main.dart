import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/controller/page_index_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.put(PageIndexController(), permanent: true);
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(useMaterial3: true),
    ),
  );
}
