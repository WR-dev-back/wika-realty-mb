class ApiEndPoints {
  static final String baseUrl = 'http://10.103.0.55:3000';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
  static _GetDataLeads getDataLeads = _GetDataLeads();
  static _PostDataLeads postDataLeads = _PostDataLeads();
}

class _AuthEndPoints {
  final String loginEmail = '/api/v1/auth/login';
}

class _GetDataLeads {
  final String dataLeads = '/api/v1/leads?orderBy=DESC&page=1&limit=25';
}

class _PostDataLeads {
  final String postLeads = '/api/v1/leads';
}
