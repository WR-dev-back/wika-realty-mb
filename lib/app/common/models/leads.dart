// To parse this JSON data, do
//
//     final leads = leadsFromJson(jsonString);

import 'dart:convert';

Leads leadsFromJson(String str) => Leads.fromJson(json.decode(str));

String leadsToJson(Leads data) => json.encode(data.toJson());

class Leads {
  int total;
  int page;
  int count;
  int pageCount;
  List<Datum> data;

  Leads({
    required this.total,
    required this.page,
    required this.count,
    required this.pageCount,
    required this.data,
  });

  factory Leads.fromJson(Map<String, dynamic> json) => Leads(
        total: json["total"],
        page: json["page"],
        count: json["count"],
        pageCount: json["pageCount"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "count": count,
        "pageCount": pageCount,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String leadsCode;
  String? digitalSource;
  String? offlineSource;
  String? locationOffline;
  String fullName;
  String phoneNumber;
  String email;
  String npwp;
  String? city;
  String salesForce;
  String? ppu;
  String? type;
  int area;
  String? omzet;
  bool isRead;
  bool isSend;
  List<LeadFollowUp> leadFollowUp;
  dynamic user;

  Datum({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.leadsCode,
    required this.digitalSource,
    required this.offlineSource,
    required this.locationOffline,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.npwp,
    required this.city,
    required this.salesForce,
    required this.ppu,
    required this.type,
    required this.area,
    required this.omzet,
    required this.isRead,
    required this.isSend,
    required this.leadFollowUp,
    required this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        leadsCode: json["leads_code"],
        digitalSource: json["digital_source"],
        offlineSource: json["offline_source"],
        locationOffline: json["location_offline"],
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        npwp: json["npwp"],
        city: json["city"],
        salesForce: json["sales_force"],
        ppu: json["ppu"],
        type: json["type"],
        area: json["area"],
        omzet: json["omzet"],
        isRead: json["isRead"],
        isSend: json["isSend"],
        leadFollowUp: List<LeadFollowUp>.from(
            json["LeadFollowUp"].map((x) => LeadFollowUp.fromJson(x))),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "leads_code": leadsCode,
        "digital_source": digitalSource,
        "offline_source": offlineSource,
        "location_offline": locationOffline,
        "full_name": fullName,
        "phone_number": phoneNumber,
        "email": email,
        "npwp": npwp,
        "city": city,
        "sales_force": salesForce,
        "ppu": ppu,
        "type": type,
        "area": area,
        "omzet": omzet,
        "isRead": isRead,
        "isSend": isSend,
        "LeadFollowUp": List<dynamic>.from(leadFollowUp.map((x) => x.toJson())),
        "user": user,
      };
}

class LeadFollowUp {
  String id;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int type;
  DateTime date;
  String followUp;
  String prospects;
  String status;

  LeadFollowUp({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
    required this.date,
    required this.followUp,
    required this.prospects,
    required this.status,
  });

  factory LeadFollowUp.fromJson(Map<String, dynamic> json) => LeadFollowUp(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        type: json["type"],
        date: DateTime.parse(json["date"]),
        followUp: json["follow_up"],
        prospects: json["prospects"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "type": type,
        "date": date.toIso8601String(),
        "follow_up": followUp,
        "prospects": prospects,
        "status": status,
      };
}
