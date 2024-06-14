import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../auth/login/model/auth_model.dart';

class HomeController extends GetxController {
  var isRefreshing = false.obs; // Reactive variable for ppu
  late User user; // Nullable user variable
  late Ppu ppu; // Nullable ppu variable
  var menus = <Menu>[].obs; // Reactive variable for list of menus

  final GetStorage storage = GetStorage();

  Future<void> refreshData() async {
    isRefreshing(true);

    await Future.delayed(
      Duration(seconds: 2),
    );

    isRefreshing(false);
  }

  @override
  void onInit() {
    super.onInit();

    final String userJson = storage.read('user');
    try {
      user = User.fromJson(jsonDecode(userJson));
    } catch (e) {
      print('Error parsing user data: $e');
    }

    final String ppuJson = storage.read('ppu');
    ppu = Ppu.fromJson(jsonDecode(ppuJson));

    final String menuJsonList = storage.read('menuList');
    menus.value = (jsonDecode(menuJsonList) as List)
        .map((e) => Menu.fromJson(e))
        .toList();
  }

  Future<List<Menu>> retrieveStoredData(bool isMobile) async {
    final String? menuListJson = storage.read('menuList');
    if (menuListJson != null) {
      final List<dynamic> jsonData = jsonDecode(menuListJson);
      final List<Menu> menuList = jsonData
          .map((e) => Menu.fromJson(e))
          .where((menu) => isMobile ? menu.isMobile : !menu.isMobile)
          .toList();
      return menuList;
    } else {
      return [];
    }
  }
}
