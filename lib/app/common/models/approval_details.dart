// To parse this JSON data, do
//
//     final approvalDetail = approvalDetailFromJson(jsonString);

import 'dart:convert';

ApprovalDetail approvalDetailFromJson(String str) =>
    ApprovalDetail.fromJson(json.decode(str));

String approvalDetailToJson(ApprovalDetail data) => json.encode(data.toJson());

class ApprovalDetail {
  bool? status;
  String? message;
  Data? data;

  ApprovalDetail({
    this.status,
    this.message,
    this.data,
  });

  factory ApprovalDetail.fromJson(Map<String, dynamic> json) => ApprovalDetail(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  String id;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String status;
  String name;
  String approvalPositionName;
  String code;
  String group;
  dynamic property;
  PurchaseOrder purchaseOrder;

  Data({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.name,
    required this.approvalPositionName,
    required this.code,
    required this.group,
    required this.property,
    required this.purchaseOrder,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        status: json["status"],
        name: json["name"],
        approvalPositionName: json["approval_position_name"],
        code: json["code"],
        group: json["group"],
        property: json["property"],
        purchaseOrder: PurchaseOrder.fromJson(json["purchaseOrder"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "status": status,
        "name": name,
        "approval_position_name": approvalPositionName,
        "code": code,
        "group": group,
        "property": property,
        "purchaseOrder": purchaseOrder.toJson(),
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
  List<Item> items;

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
    required this.poGroup,
    required this.companyCode,
    required this.releaseGroup,
    required this.releaseGroupDesc,
    required this.releaseCode,
    required this.poNumber,
    required this.userId,
    required this.userEmail,
    required this.attachmentLink,
    required this.approvalStatus,
    required this.isSend,
    required this.items,
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
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
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
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String id;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String poItem;
  String accountAssignment;
  String itemCategory;
  String materialCode;
  String materialDesc;
  String poQuantity;
  String poUnit;
  String deliveryDate;
  String unitPrice;
  String itemTotalPrice;
  String currency;
  String materialGroup;
  String plant;
  String plantDesc;
  String storageLocation;
  String storageLocationDesc;
  String requisitioner;
  String purchaseRequisition;
  String requisitionItem;
  dynamic contract;
  dynamic contractItem;
  String rfq;
  String rfqItem;
  List<Detail> details;

  Item({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.poItem,
    required this.accountAssignment,
    required this.itemCategory,
    required this.materialCode,
    required this.materialDesc,
    required this.poQuantity,
    required this.poUnit,
    required this.deliveryDate,
    required this.unitPrice,
    required this.itemTotalPrice,
    required this.currency,
    required this.materialGroup,
    required this.plant,
    required this.plantDesc,
    required this.storageLocation,
    required this.storageLocationDesc,
    required this.requisitioner,
    required this.purchaseRequisition,
    required this.requisitionItem,
    required this.contract,
    required this.contractItem,
    required this.rfq,
    required this.rfqItem,
    required this.details,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        poItem: json["po_item"],
        accountAssignment: json["account_assignment"],
        itemCategory: json["item_category"],
        materialCode: json["material_code"],
        materialDesc: json["material_desc"],
        poQuantity: json["po_quantity"],
        poUnit: json["po_unit"],
        deliveryDate: json["delivery_date"],
        unitPrice: json["unit_price"],
        itemTotalPrice: json["item_total_price"],
        currency: json["currency"],
        materialGroup: json["material_group"],
        plant: json["plant"],
        plantDesc: json["plant_desc"],
        storageLocation: json["storage_location"],
        storageLocationDesc: json["storage_location_desc"],
        requisitioner: json["requisitioner"],
        purchaseRequisition: json["purchase_requisition"],
        requisitionItem: json["requisition_item"],
        contract: json["contract"],
        contractItem: json["contract_item"],
        rfq: json["rfq"],
        rfqItem: json["rfq_item"],
        details:
            List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "po_item": poItem,
        "account_assignment": accountAssignment,
        "item_category": itemCategory,
        "material_code": materialCode,
        "material_desc": materialDesc,
        "po_quantity": poQuantity,
        "po_unit": poUnit,
        "delivery_date": deliveryDate,
        "unit_price": unitPrice,
        "item_total_price": itemTotalPrice,
        "currency": currency,
        "material_group": materialGroup,
        "plant": plant,
        "plant_desc": plantDesc,
        "storage_location": storageLocation,
        "storage_location_desc": storageLocationDesc,
        "requisitioner": requisitioner,
        "purchase_requisition": purchaseRequisition,
        "requisition_item": requisitionItem,
        "contract": contract,
        "contract_item": contractItem,
        "rfq": rfq,
        "rfq_item": rfqItem,
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
      };
}

class Detail {
  String id;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String costCenter;
  String costCenterDesc;
  String order;
  String orderDesc;
  String latestGrDate;
  String serviceLineItem;
  String serviceNo;
  String serviceDesc;
  String serviceQuantity;
  String serviceUnit;
  String servicePrice;
  dynamic serviceTotalPrice;
  String procurementName;

  Detail({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.costCenter,
    required this.costCenterDesc,
    required this.order,
    required this.orderDesc,
    required this.latestGrDate,
    required this.serviceLineItem,
    required this.serviceNo,
    required this.serviceDesc,
    required this.serviceQuantity,
    required this.serviceUnit,
    required this.servicePrice,
    required this.serviceTotalPrice,
    required this.procurementName,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        costCenter: json["cost_center"],
        costCenterDesc: json["cost_center_desc"],
        order: json["order"],
        orderDesc: json["order_desc"],
        latestGrDate: json["latest_gr_date"],
        serviceLineItem: json["service_line_item"],
        serviceNo: json["service_no"],
        serviceDesc: json["service_desc"],
        serviceQuantity: json["service_quantity"],
        serviceUnit: json["service_unit"],
        servicePrice: json["service_price"],
        serviceTotalPrice: json["service_total_price"],
        procurementName: json["procurement_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "cost_center": costCenter,
        "cost_center_desc": costCenterDesc,
        "order": order,
        "order_desc": orderDesc,
        "latest_gr_date": latestGrDate,
        "service_line_item": serviceLineItem,
        "service_no": serviceNo,
        "service_desc": serviceDesc,
        "service_quantity": serviceQuantity,
        "service_unit": serviceUnit,
        "service_price": servicePrice,
        "service_total_price": serviceTotalPrice,
        "procurement_name": procurementName,
      };
}
