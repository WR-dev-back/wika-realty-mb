class ApiEndPoints {
  static const String baseUrl = 'http://backend.sdsn.io';

  static final AuthEndpoints auth = AuthEndpoints();
  static final UserEndpoints user = UserEndpoints();
  static final LeadsEndpoints leads = LeadsEndpoints();
  static final ApprovalEndpoints approval = ApprovalEndpoints();
  static final NotificationEndpoints notification = NotificationEndpoints();
}

class AuthEndpoints {
  final String loginEmail = '/api/v1/auth/login';
}

class UserEndpoints {
  final String userData = '/api/v1/users/';
}

class LeadsEndpoints {
  final String dataLeads = '/api/v1/leads?orderBy=DSC&';
  final String postLeads = '/api/v1/leads';
  final String checkDuplicate = '/api/v1/leads/duplicate';
  final String editLeads = '/api/v1/leads/update/';
  final String followUp = '/api/v1/leads/follow-up/';
}

class ApprovalEndpoints {
  final String dataApproval =
      '/api/v1/master-approval/user-approval?orderBy=DSC&page=1&limit=25';
  final String detailApproval = '/api/v1/master-approval/user-approval/';
  final String negotiation = '/api/v1/master-approval/user-negotiation';
}

class NotificationEndpoints {
  final String getLocation = '/api/v1/pm-notif-locations?orderBy=ASC';
  final String getGroupCause = '/api/v1/pm-notif-couses?orderBy=ASC';
  final String getEquipment = '/api/v1/pm-notif-equipments?orderBy=ASC';
  final String getGroupProblem = '/api/v1/pm-notif-groups?orderBy=ASC&';
}
