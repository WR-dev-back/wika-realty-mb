class Location {
  int? total;
  int? page;
  int? count;
  int? pageCount;
  List<Datum>? data;

  Location({
    this.total,
    this.page,
    this.count,
    this.pageCount,
    this.data,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
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
  String? mainPlant;
  String? planingPlant;
  String? plannerGroup;
  String? mainWork;
  CostProfitCenter? costProfitCenter;
  String? name;

  Datum({
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
    this.costProfitCenter,
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
        mainPlant: json["main_plant"]!,
        planingPlant: json["planing_plant"]!,
        plannerGroup: json["planner_group"]!,
        mainWork: json["main_work"]!,
        costProfitCenter: json["costProfitCenter"] == null
            ? null
            : CostProfitCenter.fromJson(json["costProfitCenter"]),
        name: json["name"],
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
        "costProfitCenter": costProfitCenter?.toJson(),
        "name": name,
      };
}

class CostProfitCenter {
  String? id;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? code;
  String? name;
  String? descriptions;

  CostProfitCenter({
    this.id,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.code,
    this.name,
    this.descriptions,
  });

  factory CostProfitCenter.fromJson(Map<String, dynamic> json) =>
      CostProfitCenter(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        code: json["code"]!,
        name: json["name"]!,
        descriptions: json["descriptions"]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "code": code,
        "name": name,
        "descriptions": descriptions,
      };
}
