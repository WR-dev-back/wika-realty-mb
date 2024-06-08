class ApiEndPoints {
  static final String baseUrl = 'http://192.168.100.74:8080';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
  static _GetDataLeads getDataLeads = _GetDataLeads();
  static _PostDataLeads postDataLeads = _PostDataLeads();
  static _CheckNum checkLeads = _CheckNum();
  static _EditLeads puteditLeads = _EditLeads();
  static _FollowUpLeads followUpLeads = _FollowUpLeads();
}

class _AuthEndPoints {
  final String loginEmail = '/api/v1/auth/login';
}

class _GetDataLeads {
  final String dataLeads = '/api/v1/leads?orderBy=DSC&';
}

class _PostDataLeads {
  final String postLeads = '/api/v1/leads';
}

class _CheckNum {
  final String checkDuplicate = '/api/v1/leads/duplicate';
}

class _EditLeads {
  final String editLeads = '/api/v1/leads/update/';
}

class _FollowUpLeads {
  final String follow = '/api/v1/leads/follow-up/';
}
