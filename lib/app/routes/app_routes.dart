part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const SPLASHSCREEN = _Paths.SPLASHSCREEN;
  static const LOGIN = _Paths.LOGIN;
  static const PROFILE = _Paths.PROFILE;
  static const DENDA = _Paths.DENDA;
  static const APPROVAL = _Paths.APPROVAL;
  static const LEADS = _Paths.LEADS;
  static const DETAIL_LEADS = _Paths.DETAIL_LEADS;
  static const EDIT_DETAIL_LEADS = _Paths.EDIT_DETAIL_LEADS;
  static const FOLLOWUP_LEADS = _Paths.FOLLOWUP_LEADS;
  static const DETAIL_APPROVAL = _Paths.DETAIL_APPROVAL;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const SPLASHSCREEN = '/splashscreen';
  static const LOGIN = '/login';
  static const PROFILE = '/profile';
  static const DENDA = '/denda';
  static const APPROVAL = '/approval';
  static const LEADS = '/leads';
  static const DETAIL_LEADS = '/detail-leads';
  static const EDIT_DETAIL_LEADS = '/edit-detail-leads';
  static const FOLLOWUP_LEADS = '/followup-leads';
  static const DETAIL_APPROVAL = '/detail-approval';
}
