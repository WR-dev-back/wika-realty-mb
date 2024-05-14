import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wr_project/app/controller/page_index_controller.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  Get.put(PageIndexController(), permanent: true);
  runApp(
    GetMaterialApp(
      title: "WR Project",
      debugShowCheckedModeBanner: false,
      initialRoute: token != null ? Routes.HOME : AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
    ),
  );
}
