// To parse this JSON data, do
//
//     final body = bodyFromJson(jsonString);

import 'dart:convert';

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));

String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  bool status;
  String message;
  Data data;

  Body({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
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
  String token;
  List<Module> roles;
  List<Module> modules;
  List<Menu> menus;

  Data({
    required this.token,
    required this.roles,
    required this.modules,
    required this.menus,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        roles: List<Module>.from(json["roles"].map((x) => Module.fromJson(x))),
        modules:
            List<Module>.from(json["modules"].map((x) => Module.fromJson(x))),
        menus: List<Menu>.from(json["menus"].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "modules": List<dynamic>.from(modules.map((x) => x.toJson())),
        "menus": List<dynamic>.from(menus.map((x) => x.toJson())),
      };
}

class Menu {
  String id;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  dynamic url;
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
      };
}

class Module {
  String id;
  String name;

  Module({
    required this.id,
    required this.name,
  });

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
