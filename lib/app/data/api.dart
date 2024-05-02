class ApiEndPoints {
  static final String baseUrl = 'http://10.101.0.151:3000/docs/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'authaccount/registration';
  final String loginEmail = '/Auth/AuthController_login';
}
