class ApiEndPoints {
  static final String baseUrl = 'http://10.101.0.52:3000';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String loginEmail = '/api/v1/auth/login';
}
