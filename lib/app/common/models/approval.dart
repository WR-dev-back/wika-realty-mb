import 'dart:convert';

Approval approvalFromJson(String str) => Approval.fromJson(json.decode(str));

String approvalToJson(Approval data) => json.encode(data.toJson());

class Approval {
  int total;
  int page;
  int count;
  int pageCount;
  List<Datum> data;

  Approval({
    required this.total,
    required this.page,
    required this.count,
    required this.pageCount,
    required this.data,
  });

  factory Approval.fromJson(Map<String, dynamic> json) => Approval(
        total: json["total"] ?? 0,
        page: json["page"] ?? 0,
        count: json["count"] ?? 0,
        pageCount: json["pageCount"] ?? 0,
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
  String status;
  String name;
  String group;
  Property? property;
  PurchaseOrder? purchaseOrder;
  String? approvalPositionName;
  String? code;

  Datum({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.name,
    required this.group,
    required this.property,
    required this.purchaseOrder,
    this.approvalPositionName,
    this.code,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        status: json["status"],
        name: json["name"],
        group: json["group"],
        property: json["property"] == null
            ? null
            : Property.fromJson(json["property"]),
        purchaseOrder: json["purchaseOrder"] == null
            ? null
            : PurchaseOrder.fromJson(json["purchaseOrder"]),
        approvalPositionName: json["approval_position_name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "status": status,
        "name": name,
        "group": group,
        "property": property?.toJson(),
        "purchaseOrder": purchaseOrder?.toJson(),
        "approval_position_name": approvalPositionName,
        "code": code,
      };
}

class Property {
  String id;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String contractNo;
  String itemNo;
  String ppuCode;
  String customerCode;
  String customerName;
  String unitCode;
  String unitDesc;
  String contractValueNetto;
  String contractValueBrutto;
  String bookingFeeNetto;
  String bookingFeeBruto;
  String total;
  String progressConst;
  String cancelDate;
  dynamic refundRecommendation;
  String approvalStatus;
  dynamic riRefound;
  dynamic recommendationValue;
  dynamic costCenter;
  bool isRead;
  bool isSend;

  Property({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.contractNo,
    required this.itemNo,
    required this.ppuCode,
    required this.customerCode,
    required this.customerName,
    required this.unitCode,
    required this.unitDesc,
    required this.contractValueNetto,
    required this.contractValueBrutto,
    required this.bookingFeeNetto,
    required this.bookingFeeBruto,
    required this.total,
    required this.progressConst,
    required this.cancelDate,
    this.refundRecommendation,
    required this.approvalStatus,
    this.riRefound,
    this.recommendationValue,
    this.costCenter,
    required this.isRead,
    required this.isSend,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        contractNo: json["contract_no"],
        itemNo: json["item_no"],
        ppuCode: json["ppu_code"],
        customerCode: json["customer_code"],
        customerName: json["customer_name"],
        unitCode: json["unit_code"],
        unitDesc: json["unit_desc"],
        contractValueNetto: json["contract_value_netto"],
        contractValueBrutto: json["contract_value_brutto"],
        bookingFeeNetto: json["booking_fee_netto"],
        bookingFeeBruto: json["booking_fee_bruto"],
        total: json["total"],
        progressConst: json["progress_const"],
        cancelDate: json["cancel_date"],
        refundRecommendation: json["refund_recommendation"],
        approvalStatus: json["approval_status"],
        riRefound: json["ri_refound"],
        recommendationValue: json["recommendation_value"],
        costCenter: json["cost_center"],
        isRead: json["isRead"],
        isSend: json["isSend"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "contract_no": contractNo,
        "item_no": itemNo,
        "ppu_code": ppuCode,
        "customer_code": customerCode,
        "customer_name": customerName,
        "unit_code": unitCode,
        "unit_desc": unitDesc,
        "contract_value_netto": contractValueNetto,
        "contract_value_brutto": contractValueBrutto,
        "booking_fee_netto": bookingFeeNetto,
        "booking_fee_bruto": bookingFeeBruto,
        "total": total,
        "progress_const": progressConst,
        "cancel_date": cancelDate,
        "refund_recommendation": refundRecommendation,
        "approval_status": approvalStatus,
        "ri_refound": riRefound,
        "recommendation_value": recommendationValue,
        "cost_center": costCenter,
        "isRead": isRead,
        "isSend": isSend,
      };
}

class PurchaseOrder {
  String id;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String poType;
  String typeDesc;
  String vendor;
  String vendorDesc;
  String docDate;
  String totalPrice;
  String poOrg;
  dynamic poGroup;
  String companyCode;
  String releaseGroup;
  String releaseGroupDesc;
  String releaseCode;
  String poNumber;
  dynamic userId;
  dynamic userEmail;
  dynamic attachmentLink;
  String approvalStatus;
  bool isSend;

  PurchaseOrder({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.poType,
    required this.typeDesc,
    required this.vendor,
    required this.vendorDesc,
    required this.docDate,
    required this.totalPrice,
    required this.poOrg,
    this.poGroup,
    required this.companyCode,
    required this.releaseGroup,
    required this.releaseGroupDesc,
    required this.releaseCode,
    required this.poNumber,
    this.userId,
    this.userEmail,
    this.attachmentLink,
    required this.approvalStatus,
    required this.isSend,
  });

  factory PurchaseOrder.fromJson(Map<String, dynamic> json) => PurchaseOrder(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        poType: json["po_type"],
        typeDesc: json["type_desc"],
        vendor: json["vendor"],
        vendorDesc: json["vendor_desc"],
        docDate: json["doc_date"],
        totalPrice: json["total_price"],
        poOrg: json["po_org"],
        poGroup: json["po_group"],
        companyCode: json["company_code"],
        releaseGroup: json["release_group"],
        releaseGroupDesc: json["release_group_desc"],
        releaseCode: json["release_code"],
        poNumber: json["po_number"],
        userId: json["user_id"],
        userEmail: json["user_email"],
        attachmentLink: json["attachment_link"],
        approvalStatus: json["approval_status"],
        isSend: json["isSend"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "po_type": poType,
        "type_desc": typeDesc,
        "vendor": vendor,
        "vendor_desc": vendorDesc,
        "doc_date": docDate,
        "total_price": totalPrice,
        "po_org": poOrg,
        "po_group": poGroup,
        "company_code": companyCode,
        "release_group": releaseGroup,
        "release_group_desc": releaseGroupDesc,
        "release_code": releaseCode,
        "po_number": poNumber,
        "user_id": userId,
        "user_email": userEmail,
        "attachment_link": attachmentLink,
        "approval_status": approvalStatus,
        "isSend": isSend,
      };
}
