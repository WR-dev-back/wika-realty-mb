import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../auth/login/model/login_model.dart';

class HomeController extends GetxController {
  var isRefreshing = false.obs;

  Future<void> refreshData() async {
    isRefreshing(true);

    await Future.delayed(
      Duration(
        seconds: 2,
      ),
    );

    isRefreshing(false);
  }

  User? user;
  List<Menu>? menuList;

  @override
  void onInit() {
    super.onInit();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userJson = prefs.getString('user');
    if (userJson != null) {
      user = User.fromJson(jsonDecode(userJson));
    }
    update(); // Update the UI
  }

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
