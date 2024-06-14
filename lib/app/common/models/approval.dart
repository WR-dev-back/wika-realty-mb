class Approval {
  final String id;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final String status;
  final String name;
  final String group;
  final Property property;

  Approval({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.name,
    required this.group,
    required this.property,
  });

  factory Approval.fromJson(Map<String, dynamic> json) {
    return Approval(
      id: json['id'],
      isActive: json['isActive'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      status: json['status'],
      name: json['name'],
      group: json['group'],
      property: Property.fromJson(json['property']),
    );
  }
}

class Property {
  final String id;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final String contractNo;
  final String itemNo;
  final String ppuCode;
  final String customerCode;
  final String customerName;
  final String unitCode;
  final String unitDesc;
  final String contractValueNetto;
  final String contractValueBrutto;
  final String bookingFeeNetto;
  final String bookingFeeBruto;
  final String total;
  final String progressConst;
  final String cancelDate;
  final String? refundRecommendation;
  final String approvalStatus;
  final String riRefound;
  final String? recommendationValue;
  final bool isRead;
  final bool isSend;

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
    required this.riRefound,
    this.recommendationValue,
    required this.isRead,
    required this.isSend,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      isActive: json['isActive'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      contractNo: json['contract_no'],
      itemNo: json['item_no'],
      ppuCode: json['ppu_code'],
      customerCode: json['customer_code'],
      customerName: json['customer_name'],
      unitCode: json['unit_code'],
      unitDesc: json['unit_desc'],
      contractValueNetto: json['contract_value_netto'],
      contractValueBrutto: json['contract_value_brutto'],
      bookingFeeNetto: json['booking_fee_netto'],
      bookingFeeBruto: json['booking_fee_bruto'],
      total: json['total'],
      progressConst: json['progress_const'],
      cancelDate: json['cancel_date'],
      refundRecommendation: json['refund_recommendation'],
      approvalStatus: json['approval_status'],
      riRefound: json['ri_refound'],
      recommendationValue: json['recommendation_value'],
      isRead: json['isRead'],
      isSend: json['isSend'],
    );
  }
}
