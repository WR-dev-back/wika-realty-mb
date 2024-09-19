// To parse this JSON data, do
//
//     final leads = leadsFromJson(jsonString);

import 'dart:convert';

Leads leadsFromJson(String str) => Leads.fromJson(json.decode(str));

String leadsToJson(Leads data) => json.encode(data.toJson());

class Leads {
  int? total;
  int? page;
  int? count;
  int? pageCount;
  List<Datum>? data;

  Leads({
    this.total,
    this.page,
    this.count,
    this.pageCount,
    this.data,
  });

  factory Leads.fromJson(Map<String, dynamic> json) => Leads(
        total: json["total"],
        page: json["page"],
        count: json["count"],
        pageCount: json["pageCount"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "count": count,
        "pageCount": pageCount,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? leadsCode;
  String? digitalSource;
  String? offlineSource;
  String? locationOffline;
  String? fullName;
  String? phoneNumber;
  String? email;
  String? npwp;
  String? city;
  String? salesForce;
  String? ppu;
  String? type;
  int? area;
  String? omzet;
  bool? isRead;
  bool? isSend;
  List<LeadFollowUp>? leadFollowUp;
  User? user;

  Datum({
    this.id,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.leadsCode,
    this.digitalSource,
    this.offlineSource,
    this.locationOffline,
    this.fullName,
    this.phoneNumber,
    this.email,
    this.npwp,
    this.city,
    this.salesForce,
    this.ppu,
    this.type,
    this.area,
    this.omzet,
    this.isRead,
    this.isSend,
    this.leadFollowUp,
    this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
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
        leadFollowUp: json["LeadFollowUp"] == null
            ? []
            : List<LeadFollowUp>.from(
                json["LeadFollowUp"]!.map((x) => LeadFollowUp.fromJson(x))),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
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
        "LeadFollowUp": leadFollowUp == null
            ? []
            : List<dynamic>.from(leadFollowUp!.map((x) => x.toJson())),
        "user": user?.toJson(),
      };
}

class LeadFollowUp {
  String? id;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? type;
  DateTime? date;
  String? followUp;
  String? prospects;
  String? status;

  LeadFollowUp({
    this.id,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.type,
    this.date,
    this.followUp,
    this.prospects,
    this.status,
  });

  factory LeadFollowUp.fromJson(Map<String, dynamic> json) => LeadFollowUp(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        type: json["type"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        followUp: json["follow_up"],
        prospects: json["prospects"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "type": type,
        "date": date?.toIso8601String(),
        "follow_up": followUp,
        "prospects": prospects,
        "status": status,
      };
}

class User {
  String? id;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? email;
  String? username;
  String? phone;
  String? password;
  dynamic pushToken;
  bool? isPasswordChanged;
  dynamic apiKey;
  dynamic token;

  User({
    this.id,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.email,
    this.username,
    this.phone,
    this.password,
    this.pushToken,
    this.isPasswordChanged,
    this.apiKey,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        name: json["name"],
        email: json["email"],
        username: json["username"],
        phone: json["phone"],
        password: json["password"],
        pushToken: json["pushToken"],
        isPasswordChanged: json["isPasswordChanged"],
        apiKey: json["apiKey"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "name": name,
        "email": email,
        "username": username,
        "phone": phone,
        "password": password,
        "pushToken": pushToken,
        "isPasswordChanged": isPasswordChanged,
        "apiKey": apiKey,
        "token": token,
      };
}
