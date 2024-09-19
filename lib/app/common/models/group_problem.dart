class GroupProblem {
  int? total;
  int? page;
  int? count;
  int? pageCount;
  List<Datum>? data;

  GroupProblem({
    this.total,
    this.page,
    this.count,
    this.pageCount,
    this.data,
  });

  factory GroupProblem.fromJson(Map<String, dynamic> json) => GroupProblem(
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
  String? type;
  String? code;
  String? text;
  String? name;

  Datum({
    this.id,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.type,
    this.code,
    this.text,
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
        type: json["type"]!,
        code: json["code"],
        text: json["text"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "type": type,
        "code": code,
        "text": text,
        "name": name,
      };
}
