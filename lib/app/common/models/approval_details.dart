class ApprovalDetail {
  bool status;
  String message;
  Data data;

  ApprovalDetail({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApprovalDetail.fromJson(Map<String, dynamic> json) => ApprovalDetail(
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
  String id;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;
  String? name;
  dynamic approvalPositionName;
  dynamic code;
  String? group;
  Property? property;
  PurchaseOrder? purchaseOrder;
  PurchaseRequisition? purchaseRequisition;

  Data({
    required this.id,
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
        "status": status,
        "name": name,
        "approval_position_name": approvalPositionName,
        "code": code,
        "group": group,
        "property": property!.toJson(),
        "purchaseOrder": purchaseOrder!.toJson(),
        "purchaseRequisition": purchaseRequisition?.toJson(),
      };
}

class Property {
  String id;
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
  String? approvalStatus;
  String? riRefound;
  String? recommendationValue;
  String? costCenter;
  bool isRead;
  bool isSend;

  Property({
    required this.id,
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
  DateTime? createdAt;
  DateTime? updatedAt;
  String? poType;
  String? typeDesc;
  String? vendor;
  String? vendorDesc;
  String? docDate;
  String? totalPrice;
  String? poOrg;
  dynamic poGroup;
  String? companyCode;
  String? releaseGroup;
  String? releaseGroupDesc;
  String? releaseCode;
  String? poNumber;
  dynamic userId;
  dynamic userEmail;
  dynamic attachmentLink;
  String approvalStatus;
  bool isSend;
  List<ItemPo>? itemsPo;

  PurchaseOrder({
    required this.id,
    required this.isActive,
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
    required this.approvalStatus,
    required this.isSend,
    this.itemsPo,
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
        itemsPo:
            List<ItemPo>.from(json["items"].map((x) => ItemPo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
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
        "items": List<dynamic>.from(itemsPo!.map((x) => x.toJson())),
      };
}

class ItemPo {
  String id;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String? poItem;
  String? accountAssignment;
  String? itemCategory;
  String? materialCode;
  String? materialDesc;
  String? poQuantity;
  String? poUnit;
  String? deliveryDate;
  String? unitPrice;
  String? itemTotalPrice;
  String? currency;
  String? materialGroup;
  String? plant;
  String? plantDesc;
  String? storageLocation;
  String? storageLocationDesc;
  String? requisitioner;
  String? purchaseRequisition;
  String? requisitionItem;
  dynamic contract;
  dynamic contractItem;
  String? rfq;
  String? rfqItem;
  List<DetailPo> details;

  ItemPo({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.poItem,
    this.accountAssignment,
    this.itemCategory,
    this.materialCode,
    this.materialDesc,
    this.poQuantity,
    this.poUnit,
    this.deliveryDate,
    this.unitPrice,
    this.itemTotalPrice,
    this.currency,
    this.materialGroup,
    this.plant,
    this.plantDesc,
    this.storageLocation,
    this.storageLocationDesc,
    this.requisitioner,
    this.purchaseRequisition,
    this.requisitionItem,
    this.contract,
    this.contractItem,
    this.rfq,
    this.rfqItem,
    required this.details,
  });

  factory ItemPo.fromJson(Map<String, dynamic> json) => ItemPo(
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
        details: List<DetailPo>.from(
            json["details"].map((x) => DetailPo.fromJson(x))),
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

class DetailPo {
  String id;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String? costCenter;
  String? costCenterDesc;
  String? order;
  String? orderDesc;
  String? latestGrDate;
  String? serviceLineItem;
  String? serviceNo;
  String? serviceDesc;
  String? serviceQuantity;
  String? serviceUnit;
  String? servicePrice;
  dynamic serviceTotalPrice;
  String? procurementName;

  DetailPo({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.costCenter,
    this.costCenterDesc,
    this.order,
    this.orderDesc,
    this.latestGrDate,
    this.serviceLineItem,
    this.serviceNo,
    this.serviceDesc,
    this.serviceQuantity,
    this.serviceUnit,
    this.servicePrice,
    this.serviceTotalPrice,
    this.procurementName,
  });

  factory DetailPo.fromJson(Map<String, dynamic> json) => DetailPo(
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

class PurchaseRequisition {
  String id;
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
  String? approvalStatus;
  bool? isSend;
  List<ItemPr>? itemspr;

  PurchaseRequisition({
    required this.id,
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
    this.itemspr,
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
        approvalStatus: json["approval_status"],
        isSend: json["isSend"],
        itemspr: json["items"] == null
            ? []
            : List<ItemPr>.from(json["items"]!.map((x) => ItemPr.fromJson(x))),
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
        "approval_status": approvalStatus,
        "isSend": isSend,
        "items": itemspr == null
            ? []
            : List<dynamic>.from(itemspr!.map((x) => x.toJson())),
      };
}

class ItemPr {
  String id;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? prItem;
  String? accountAssignment;
  String? itemCategory;
  String? materialCode;
  String? materialDesc;
  String? prQuantity;
  String? prOrderUnit;
  String? documentDate;
  String? deliveryDate;
  String? unitPrice;
  String? priceUnit;
  String? totalValue;
  String? currency;
  String? materialGroup;
  String? plant;
  String? plantDesc;
  String? storageLocation;
  String? storageLocationDesc;
  String? requisitioner;
  String? costCenter;
  String? costCenterDesc;
  String? order;
  String? orderDesc;
  String? poOrg;
  String? poGroup;
  String? contract;
  String? contractItem;
  String? userId;
  List<DetailPr>? details;

  ItemPr({
    required this.id,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.prItem,
    this.accountAssignment,
    this.itemCategory,
    this.materialCode,
    this.materialDesc,
    this.prQuantity,
    this.prOrderUnit,
    this.documentDate,
    this.deliveryDate,
    this.unitPrice,
    this.priceUnit,
    this.totalValue,
    this.currency,
    this.materialGroup,
    this.plant,
    this.plantDesc,
    this.storageLocation,
    this.storageLocationDesc,
    this.requisitioner,
    this.costCenter,
    this.costCenterDesc,
    this.order,
    this.orderDesc,
    this.poOrg,
    this.poGroup,
    this.contract,
    this.contractItem,
    this.userId,
    this.details,
  });

  factory ItemPr.fromJson(Map<String, dynamic> json) => ItemPr(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        prItem: json["pr_item"],
        accountAssignment: json["account_assignment"],
        itemCategory: json["item_category"],
        materialCode: json["material_code"],
        materialDesc: json["material_desc"],
        prQuantity: json["pr_quantity"],
        prOrderUnit: json["pr_order_unit"],
        documentDate: json["document_date"],
        deliveryDate: json["delivery_date"],
        unitPrice: json["unit_price"],
        priceUnit: json["price_unit"],
        totalValue: json["total_value"],
        currency: json["currency"],
        materialGroup: json["material_group"],
        plant: json["plant"],
        plantDesc: json["plant_desc"],
        storageLocation: json["storage_location"],
        storageLocationDesc: json["storage_location_desc"],
        requisitioner: json["requisitioner"],
        costCenter: json["cost_center"],
        costCenterDesc: json["cost_center_desc"],
        order: json["order"],
        orderDesc: json["order_desc"],
        poOrg: json["po_org"],
        poGroup: json["po_group"],
        contract: json["contract"],
        contractItem: json["contract_item"],
        userId: json["user_id"],
        details: json["details"] == null
            ? []
            : List<DetailPr>.from(
                json["details"]!.map((x) => DetailPr.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "pr_item": prItem,
        "account_assignment": accountAssignment,
        "item_category": itemCategory,
        "material_code": materialCode,
        "material_desc": materialDesc,
        "pr_quantity": prQuantity,
        "pr_order_unit": prOrderUnit,
        "document_date": documentDate,
        "delivery_date": deliveryDate,
        "unit_price": unitPrice,
        "price_unit": priceUnit,
        "total_value": totalValue,
        "currency": currency,
        "material_group": materialGroup,
        "plant": plant,
        "plant_desc": plantDesc,
        "storage_location": storageLocation,
        "storage_location_desc": storageLocationDesc,
        "requisitioner": requisitioner,
        "cost_center": costCenter,
        "cost_center_desc": costCenterDesc,
        "order": order,
        "order_desc": orderDesc,
        "po_org": poOrg,
        "po_group": poGroup,
        "contract": contract,
        "contract_item": contractItem,
        "user_id": userId,
        "details": details == null
            ? []
            : List<dynamic>.from(details!.map((x) => x.toJson())),
      };
}

class DetailPr {
  String id;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? serviceLineItem;
  String? serviceNo;
  String? serviceDesc;
  String? serviceQuantity;
  String? serviceUnit;
  String? servicePrice;
  String? serviceTotalPrice;
  String? serviceCurrency;

  DetailPr({
    required this.id,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.serviceLineItem,
    this.serviceNo,
    this.serviceDesc,
    this.serviceQuantity,
    this.serviceUnit,
    this.servicePrice,
    this.serviceTotalPrice,
    this.serviceCurrency,
  });

  factory DetailPr.fromJson(Map<String, dynamic> json) => DetailPr(
        id: json["id"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        serviceLineItem: json["service_line_item"],
        serviceNo: json["service_no"],
        serviceDesc: json["service_desc"],
        serviceQuantity: json["service_quantity"],
        serviceUnit: json["service_unit"],
        servicePrice: json["service_price"],
        serviceTotalPrice: json["service_total_price"],
        serviceCurrency: json["service_currency"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "service_line_item": serviceLineItem,
        "service_no": serviceNo,
        "service_desc": serviceDesc,
        "service_quantity": serviceQuantity,
        "service_unit": serviceUnit,
        "service_price": servicePrice,
        "service_total_price": serviceTotalPrice,
        "service_currency": serviceCurrency,
      };
}
