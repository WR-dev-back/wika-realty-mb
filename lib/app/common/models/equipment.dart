class Equipment {
  int? total;
  int? page;
  int? count;
  int? pageCount;
  List<Datum>? data;

  Equipment({
    this.total,
    this.page,
    this.count,
    this.pageCount,
    this.data,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) => Equipment(
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
  String? code;
  String? description;
  String? techIdentNo;
  String? mainWorkCtr;
  PmNotifLocation? pmNotifLocation;
  String? name;

  Datum({
    this.id,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.code,
    this.description,
    this.techIdentNo,
    this.mainWorkCtr,
    this.pmNotifLocation,
    this.name,
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
        code: json["code"],
        description: json["description"],
        techIdentNo: json["TechIdentNo"],
        mainWorkCtr: json["MainWorkCtr"]!,
        pmNotifLocation: json["pm_notif_location"] == null
            ? null
            : PmNotifLocation.fromJson(json["pm_notif_location"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "code": code,
        "description": description,
        "TechIdentNo": techIdentNo,
        "MainWorkCtr": mainWorkCtr,
        "pm_notif_location": pmNotifLocation?.toJson(),
        "name": name,
      };
}

class PmNotifLocation {
  String? id;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? code;
  String? description;
  String? mainPlant;
  String? planingPlant;
  String? plannerGroup;
  String? mainWork;

  PmNotifLocation({
    this.id,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.code,
    this.description,
    this.mainPlant,
    this.planingPlant,
    this.plannerGroup,
    this.mainWork,
  });

  factory PmNotifLocation.fromJson(Map<String, dynamic> json) =>
      PmNotifLocation(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        code: json["code"]!,
        description: json["description"]!,
        mainPlant: json["main_plant"]!,
        planingPlant: json["planing_plant"]!,
        plannerGroup: json["planner_group"]!,
        mainWork: json["main_work"]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "code": code,
        "description": description,
        "main_plant": mainPlant,
        "planing_plant": planingPlant,
        "planner_group": plannerGroup,
        "main_work": mainWork,
      };
}
