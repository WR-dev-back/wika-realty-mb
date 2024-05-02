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
  List<Menu> menus;

  Data({
    required this.token,
    required this.menus,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        menus: List<Menu>.from(json["menus"].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
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
  String url;
  String? icon;
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
