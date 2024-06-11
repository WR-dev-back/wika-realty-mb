import 'dart:convert';

List<Approval> approvalFromJson(String str) =>
    List<Approval>.from(json.decode(str).map((x) => Approval.fromJson(x)));

String approvalToJson(List<Approval> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Approval {
  String code;
  String name;
  String costProfitCenter;
  List<ListElement> list;

  Approval({
    required this.code,
    required this.name,
    required this.costProfitCenter,
    required this.list,
  });

  factory Approval.fromJson(Map<String, dynamic> json) => Approval(
        code: json["code"],
        name: json["name"],
        costProfitCenter: json["costProfitCenter"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "costProfitCenter": costProfitCenter,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  String id;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String code;
  String name;
  String minOmzet;
  String maxOmzet;
  List<ApprovalDetail> approvalDetails;

  ListElement({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.code,
    required this.name,
    required this.minOmzet,
    required this.maxOmzet,
    required this.approvalDetails,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        code: json["code"],
        name: json["name"],
        minOmzet: json["minOmzet"],
        maxOmzet: json["maxOmzet"],
        approvalDetails: List<ApprovalDetail>.from(
            json["approvalDetails"].map((x) => ApprovalDetail.fromJson(x))),
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
        "approvalDetails":
            List<dynamic>.from(approvalDetails.map((x) => x.toJson())),
      };
}

class ApprovalDetail {
  String id;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;

  ApprovalDetail({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ApprovalDetail.fromJson(Map<String, dynamic> json) => ApprovalDetail(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
