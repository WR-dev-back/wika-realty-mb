import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wr_project/app/modules/dashboard/controller/page_index_controller.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  final GetStorage storage = GetStorage();

  final String? token = storage.read('token');
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
