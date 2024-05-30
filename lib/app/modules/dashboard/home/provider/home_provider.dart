import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../auth/login/model/login_model.dart';

class HomeProvider extends GetConnect {
  static const String _keyMenuList = 'menuList';

  Future<List<Menu>> retrieveStoredData(bool isMobile) async {
    final prefs = await SharedPreferences.getInstance();
    final String? menuListJson = prefs.getString(_keyMenuList);

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
