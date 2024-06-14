// To parse this JSON data, do
//
//     final leads = leadsFromJson(jsonString);

import 'dart:convert';

Leads leadsFromJson(String str) => Leads.fromJson(json.decode(str));

String leadsToJson(Leads data) => json.encode(data.toJson());

class Leads {
  bool status;
  String message;
  Data data;

  Leads({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Leads.fromJson(Map<String, dynamic> json) => Leads(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  User user;
  String token;
  List<Menu> menus;

  Data({
    required this.user,
    required this.token,
    required this.menus,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        token: json["token"],
        menus: List<Menu>.from(json["menus"].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
        "menus": List<dynamic>.from(menus.map((x) => x.toJson())),
      };
}

class Menu {
  String id;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String? url;
  String icon;
  dynamic activityName;
  bool isWeb;
  bool isMobile;
  dynamic badge;
  dynamic attributes;
  bool title;
  bool divider;
  int sequence;
  bool isIndent;
  dynamic parentClass;
  dynamic aclName;
  dynamic aclParam;
  List<Menu>? children;

  Menu({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.url,
    required this.icon,
    required this.activityName,
    required this.isWeb,
    required this.isMobile,
    required this.badge,
    required this.attributes,
    required this.title,
    required this.divider,
    required this.sequence,
    required this.isIndent,
    required this.parentClass,
    required this.aclName,
    required this.aclParam,
    this.children,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        name: json["name"],
        url: json["url"],
        icon: json["icon"],
        activityName: json["activityName"],
        isWeb: json["isWeb"],
        isMobile: json["isMobile"],
        badge: json["badge"],
        attributes: json["attributes"],
        title: json["title"],
        divider: json["divider"],
        sequence: json["sequence"],
        isIndent: json["isIndent"],
        parentClass: json["parentClass"],
        aclName: json["aclName"],
        aclParam: json["aclParam"],
        children: json["children"] == null
            ? []
            : List<Menu>.from(json["children"]!.map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "name": name,
        "url": url,
        "icon": icon,
        "activityName": activityName,
        "isWeb": isWeb,
        "isMobile": isMobile,
        "badge": badge,
        "attributes": attributes,
        "title": title,
        "divider": divider,
        "sequence": sequence,
        "isIndent": isIndent,
        "parentClass": parentClass,
        "aclName": aclName,
        "aclParam": aclParam,
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
      };
}

class User {
  String name;
  String id;
  String email;
  String username;
  Ppu ppu;
  List<Role> roles;
  Position position;

  User({
    required this.name,
    required this.id,
    required this.email,
    required this.username,
    required this.ppu,
    required this.roles,
    required this.position,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        id: json["id"],
        email: json["email"],
        username: json["username"],
        ppu: Ppu.fromJson(json["ppu"]),
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        position: Position.fromJson(json["position"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "email": email,
        "username": username,
        "ppu": ppu.toJson(),
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "position": position.toJson(),
      };
}

class Position {
  String title;
  String id;

  Position({
    required this.title,
    required this.id,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        title: json["title"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "id": id,
      };
}

class Ppu {
  String code;
  String name;
  String id;

  Ppu({
    required this.code,
    required this.name,
    required this.id,
  });

  factory Ppu.fromJson(Map<String, dynamic> json) => Ppu(
        code: json["code"],
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "id": id,
      };
}

class Role {
  String id;
  String name;

  Role({
    required this.id,
    required this.name,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
