// To parse this JSON data, do
//
//     final approval = approvalFromJson(jsonString);

import 'dart:convert';

Approval approvalFromJson(String str) => Approval.fromJson(json.decode(str));

String approvalToJson(Approval data) => json.encode(data.toJson());

class Approval {
  int? total;
  int? page;
  int? count;
  int? pageCount;
  List<Datum>? data;

  Approval({
    this.total,
    this.page,
    this.count,
    this.pageCount,
    this.data,
  });

  factory Approval.fromJson(Map<String, dynamic> json) => Approval(
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
  Status? status;
  String? name;
  String? approvalPositionName;
  String? code;
  String? group;
  Property? property;
  PurchaseOrder? purchaseOrder;
  PurchaseRequisition? purchaseRequisition;

  Datum({
    this.id,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.name,
    this.approvalPositionName,
    this.code,
    this.group,
    this.property,
    this.purchaseOrder,
    this.purchaseRequisition,
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
        status: statusValues.map[json["status"]]!,
        name: json["name"],
        approvalPositionName: json["approval_position_name"],
        code: json["code"],
        group: json["group"],
        property: json["property"] == null
            ? null
            : Property.fromJson(json["property"]),
        purchaseOrder: json["purchaseOrder"] == null
            ? null
            : PurchaseOrder.fromJson(json["purchaseOrder"]),
        purchaseRequisition: json["purchaseRequisition"] == null
            ? null
            : PurchaseRequisition.fromJson(json["purchaseRequisition"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "status": statusValues.reverse[status],
        "name": name,
        "approval_position_name": approvalPositionName,
        "code": code,
        "group": group,
        "property": property?.toJson(),
        "purchaseOrder": purchaseOrder?.toJson(),
        "purchaseRequisition": purchaseRequisition?.toJson(),
      };
}

class Property {
  String? id;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? contractNo;
  String? itemNo;
  String? ppuCode;
  String? customerCode;
  String? customerName;
  String? unitCode;
  String? unitDesc;
  String? contractValueNetto;
  String? contractValueBrutto;
  String? bookingFeeNetto;
  String? bookingFeeBruto;
  String? total;
  String? progressConst;
  String? cancelDate;
  dynamic refundRecommendation;
  Status? approvalStatus;
  String? riRefound;
  String? recommendationValue;
  String? costCenter;
  bool? isRead;
  bool? isSend;

  Property({
    this.id,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.contractNo,
    this.itemNo,
    this.ppuCode,
    this.customerCode,
    this.customerName,
    this.unitCode,
    this.unitDesc,
    this.contractValueNetto,
    this.contractValueBrutto,
    this.bookingFeeNetto,
    this.bookingFeeBruto,
    this.total,
    this.progressConst,
    this.cancelDate,
    this.refundRecommendation,
    this.approvalStatus,
    this.riRefound,
    this.recommendationValue,
    this.costCenter,
    this.isRead,
    this.isSend,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
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
        approvalStatus: statusValues.map[json["approval_status"]]!,
        riRefound: json["ri_refound"],
        recommendationValue: json["recommendation_value"],
        costCenter: json["cost_center"],
        isRead: json["isRead"],
        isSend: json["isSend"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
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
        "approval_status": statusValues.reverse[approvalStatus],
        "ri_refound": riRefound,
        "recommendation_value": recommendationValue,
        "cost_center": costCenter,
        "isRead": isRead,
        "isSend": isSend,
      };
}

enum Status { APPROVED, PENDING, REJECT }

final statusValues = EnumValues({
  "approved": Status.APPROVED,
  "pending": Status.PENDING,
  "reject": Status.REJECT
});

class PurchaseOrder {
  String? id;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  PoType? poType;
  TypeDesc? typeDesc;
  String? vendor;
  String? vendorDesc;
  DocDate? docDate;
  String? totalPrice;
  CompanyCode? poOrg;
  dynamic poGroup;
  CompanyCode? companyCode;
  ReleaseGroup? releaseGroup;
  ReleaseGroupDesc? releaseGroupDesc;
  ReleaseCode? releaseCode;
  String? poNumber;
  dynamic userId;
  dynamic userEmail;
  dynamic attachmentLink;
  Status? approvalStatus;
  bool? isSend;

  PurchaseOrder({
    this.id,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.poType,
    this.typeDesc,
    this.vendor,
    this.vendorDesc,
    this.docDate,
    this.totalPrice,
    this.poOrg,
    this.poGroup,
    this.companyCode,
    this.releaseGroup,
    this.releaseGroupDesc,
    this.releaseCode,
    this.poNumber,
    this.userId,
    this.userEmail,
    this.attachmentLink,
    this.approvalStatus,
    this.isSend,
  });

  factory PurchaseOrder.fromJson(Map<String, dynamic> json) => PurchaseOrder(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        poType: poTypeValues.map[json["po_type"]]!,
        typeDesc: typeDescValues.map[json["type_desc"]]!,
        vendor: json["vendor"],
        vendorDesc: json["vendor_desc"],
        docDate: docDateValues.map[json["doc_date"]]!,
        totalPrice: json["total_price"],
        poOrg: companyCodeValues.map[json["po_org"]]!,
        poGroup: json["po_group"],
        companyCode: companyCodeValues.map[json["company_code"]]!,
        releaseGroup: releaseGroupValues.map[json["release_group"]]!,
        releaseGroupDesc:
            releaseGroupDescValues.map[json["release_group_desc"]]!,
        releaseCode: releaseCodeValues.map[json["release_code"]]!,
        poNumber: json["po_number"],
        userId: json["user_id"],
        userEmail: json["user_email"],
        attachmentLink: json["attachment_link"],
        approvalStatus: statusValues.map[json["approval_status"]]!,
        isSend: json["isSend"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "po_type": poTypeValues.reverse[poType],
        "type_desc": typeDescValues.reverse[typeDesc],
        "vendor": vendor,
        "vendor_desc": vendorDesc,
        "doc_date": docDateValues.reverse[docDate],
        "total_price": totalPrice,
        "po_org": companyCodeValues.reverse[poOrg],
        "po_group": poGroup,
        "company_code": companyCodeValues.reverse[companyCode],
        "release_group": releaseGroupValues.reverse[releaseGroup],
        "release_group_desc": releaseGroupDescValues.reverse[releaseGroupDesc],
        "release_code": releaseCodeValues.reverse[releaseCode],
        "po_number": poNumber,
        "user_id": userId,
        "user_email": userEmail,
        "attachment_link": attachmentLink,
        "approval_status": statusValues.reverse[approvalStatus],
        "isSend": isSend,
      };
}

enum CompanyCode { C000 }

final companyCodeValues = EnumValues({"C000": CompanyCode.C000});

enum DocDate { THE_12062024, THE_26062024, THE_28062024 }

final docDateValues = EnumValues({
  "12.06.2024": DocDate.THE_12062024,
  "26.06.2024": DocDate.THE_26062024,
  "28.06.2024": DocDate.THE_28062024
});

enum PoType { YPOC }

final poTypeValues = EnumValues({"YPOC": PoType.YPOC});

enum ReleaseCode { SURROUNDING_APP, SURROUNDING_APP_TEST }

final releaseCodeValues = EnumValues({
  "Surrounding App": ReleaseCode.SURROUNDING_APP,
  "Surrounding App test": ReleaseCode.SURROUNDING_APP_TEST
});

enum ReleaseGroup { Y2 }

final releaseGroupValues = EnumValues({"Y2": ReleaseGroup.Y2});

enum ReleaseGroupDesc { PO_WIRA_100_JT }

final releaseGroupDescValues =
    EnumValues({"PO WIRA > 100 JT": ReleaseGroupDesc.PO_WIRA_100_JT});

enum TypeDesc { PRODUKSI_REGIONAL }

final typeDescValues =
    EnumValues({"Produksi Regional": TypeDesc.PRODUKSI_REGIONAL});

class PurchaseRequisition {
  String? id;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? prType;
  String? typeDesc;
  String? registeredVendorCode1;
  String? registeredVendorDesc1;
  String? registeredVendorCode2;
  String? registeredVendorDesc2;
  String? registeredVendorCode3;
  String? registeredVendorDesc3;
  String? registeredVendorCode4;
  String? registeredVendorDesc4;
  String? registeredVendorCode5;
  String? registeredVendorDesc5;
  String? newVendorName1;
  String? newVendorLocation1;
  String? newVendorName2;
  String? newVendorLocation2;
  String? newVendorName3;
  String? newVendorLocation3;
  String? newVendorName4;
  String? newVendorLocation4;
  String? newVendorName5;
  String? newVendorLocation5;
  String? procurementItemName;
  String? budgetValue;
  String? grandTotalValue;
  String? releaseGroupCode;
  String? releaseGroupDesc;
  String? releaseCodeDesc;
  String? prNumber;
  Status? approvalStatus;
  bool? isSend;

  PurchaseRequisition({
    this.id,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.prType,
    this.typeDesc,
    this.registeredVendorCode1,
    this.registeredVendorDesc1,
    this.registeredVendorCode2,
    this.registeredVendorDesc2,
    this.registeredVendorCode3,
    this.registeredVendorDesc3,
    this.registeredVendorCode4,
    this.registeredVendorDesc4,
    this.registeredVendorCode5,
    this.registeredVendorDesc5,
    this.newVendorName1,
    this.newVendorLocation1,
    this.newVendorName2,
    this.newVendorLocation2,
    this.newVendorName3,
    this.newVendorLocation3,
    this.newVendorName4,
    this.newVendorLocation4,
    this.newVendorName5,
    this.newVendorLocation5,
    this.procurementItemName,
    this.budgetValue,
    this.grandTotalValue,
    this.releaseGroupCode,
    this.releaseGroupDesc,
    this.releaseCodeDesc,
    this.prNumber,
    this.approvalStatus,
    this.isSend,
  });

  factory PurchaseRequisition.fromJson(Map<String, dynamic> json) =>
      PurchaseRequisition(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        prType: json["pr_type"],
        typeDesc: json["type_desc"],
        registeredVendorCode1: json["registered_vendor_code_1"],
        registeredVendorDesc1: json["registered_vendor_desc_1"],
        registeredVendorCode2: json["registered_vendor_code_2"],
        registeredVendorDesc2: json["registered_vendor_desc_2"],
        registeredVendorCode3: json["registered_vendor_code_3"],
        registeredVendorDesc3: json["registered_vendor_desc_3"],
        registeredVendorCode4: json["registered_vendor_code_4"],
        registeredVendorDesc4: json["registered_vendor_desc_4"],
        registeredVendorCode5: json["registered_vendor_code_5"],
        registeredVendorDesc5: json["registered_vendor_desc_5"],
        newVendorName1: json["new_vendor_name_1"],
        newVendorLocation1: json["new_vendor_location_1"],
        newVendorName2: json["new_vendor_name_2"],
        newVendorLocation2: json["new_vendor_location_2"],
        newVendorName3: json["new_vendor_name_3"],
        newVendorLocation3: json["new_vendor_location_3"],
        newVendorName4: json["new_vendor_name_4"],
        newVendorLocation4: json["new_vendor_location_4"],
        newVendorName5: json["new_vendor_name_5"],
        newVendorLocation5: json["new_vendor_location_5"],
        procurementItemName: json["procurement_item_name"],
        budgetValue: json["budget_value"],
        grandTotalValue: json["grand_total_value"],
        releaseGroupCode: json["release_group_code"],
        releaseGroupDesc: json["release_group_desc"],
        releaseCodeDesc: json["release_code_desc"],
        prNumber: json["pr_number"],
        approvalStatus: statusValues.map[json["approval_status"]]!,
        isSend: json["isSend"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "pr_type": prType,
        "type_desc": typeDesc,
        "registered_vendor_code_1": registeredVendorCode1,
        "registered_vendor_desc_1": registeredVendorDesc1,
        "registered_vendor_code_2": registeredVendorCode2,
        "registered_vendor_desc_2": registeredVendorDesc2,
        "registered_vendor_code_3": registeredVendorCode3,
        "registered_vendor_desc_3": registeredVendorDesc3,
        "registered_vendor_code_4": registeredVendorCode4,
        "registered_vendor_desc_4": registeredVendorDesc4,
        "registered_vendor_code_5": registeredVendorCode5,
        "registered_vendor_desc_5": registeredVendorDesc5,
        "new_vendor_name_1": newVendorName1,
        "new_vendor_location_1": newVendorLocation1,
        "new_vendor_name_2": newVendorName2,
        "new_vendor_location_2": newVendorLocation2,
        "new_vendor_name_3": newVendorName3,
        "new_vendor_location_3": newVendorLocation3,
        "new_vendor_name_4": newVendorName4,
        "new_vendor_location_4": newVendorLocation4,
        "new_vendor_name_5": newVendorName5,
        "new_vendor_location_5": newVendorLocation5,
        "procurement_item_name": procurementItemName,
        "budget_value": budgetValue,
        "grand_total_value": grandTotalValue,
        "release_group_code": releaseGroupCode,
        "release_group_desc": releaseGroupDesc,
        "release_code_desc": releaseCodeDesc,
        "pr_number": prNumber,
        "approval_status": statusValues.reverse[approvalStatus],
        "isSend": isSend,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
