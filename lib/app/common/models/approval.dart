// To parse this JSON data, do
//
//     final leads = leadsFromJson(jsonString);

import 'dart:convert';

List<Leads> leadsFromJson(String str) =>
    List<Leads>.from(json.decode(str).map((x) => Leads.fromJson(x)));

String leadsToJson(List<Leads> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Leads {
  String id;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String code;
  String name;
  String minOmzet;
  String maxOmzet;

  Leads({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.code,
    required this.name,
    required this.minOmzet,
    required this.maxOmzet,
  });

  factory Leads.fromJson(Map<String, dynamic> json) => Leads(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        code: json["code"],
        name: json["name"],
        minOmzet: json["minOmzet"],
        maxOmzet: json["maxOmzet"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "code": code,
        "name": name,
        "minOmzet": minOmzet,
        "maxOmzet": maxOmzet,
      };
}
