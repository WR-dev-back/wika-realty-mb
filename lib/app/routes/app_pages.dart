import 'package:get/get.dart';

import '../modules/approval/bindings/approval_binding.dart';
import '../modules/approval/views/approval_view.dart';
import '../modules/denda/bindings/denda_binding.dart';
import '../modules/denda/views/denda_view.dart';
import '../modules/leads/detail_leads/bindings/detail_leads_binding.dart';
import '../modules/leads/detail_leads/views/detail_leads_view.dart';
import '../modules/dashboard/home/bindings/home_binding.dart';
import '../modules/dashboard/home/views/home_view.dart';
import '../modules/leads/bindings/leads_binding.dart';
import '../modules/leads/views/leads_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DENDA,
      page: () => DendaView(),
      binding: DendaBinding(),
    ),
    GetPage(
      name: _Paths.APPROVAL,
      page: () => const ApprovalView(),
      binding: ApprovalBinding(),
    ),
    GetPage(
      name: _Paths.LEADS,
      page: () => LeadsView(),
      binding: LeadsBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_LEADS,
      page: () => DetailLeadsView(),
      binding: DetailLeadsBinding(),
    ),
  ];
}
