class Invoice {
  final int? integrationId;
  final int? orderCode;
  final int? branchCode;
  final int? sequence;
  final String? accessKey;
  final int? code;
  final String? serial;
  final DateTime? issueDate;
  final String? status;
  final String? shippingCompanyName;
  final int? packageNumber;
  final double? grossWeight;
  final double? netWeight;
  final String? trackingCode;
  final double? discountPercentage;
  final double? quantity;
  final double? productValue;
  final double? additionalValue;
  final double? shippingValue;
  final double? insuranceValue;
  final double? ipiValue;
  final double? totalValue;

  Invoice({
    this.integrationId,
    this.orderCode,
    this.branchCode,
    this.sequence,
    this.accessKey,
    this.code,
    this.serial,
    this.issueDate,
    this.status,
    this.shippingCompanyName,
    this.packageNumber,
    this.grossWeight,
    this.netWeight,
    this.trackingCode,
    this.discountPercentage,
    this.quantity,
    this.productValue,
    this.additionalValue,
    this.shippingValue,
    this.insuranceValue,
    this.ipiValue,
    this.totalValue,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      integrationId: json['integrationId'] as int?,
      orderCode: json['orderCode'] as int?,
      branchCode: json['branchCode'] as int?,
      sequence: json['sequence'] as int?,
      accessKey: json['accessKey'] as String?,
      code: json['code'] as int?,
      serial: json['serial'] as String?,
      issueDate:
          json['issueDate'] != null ? DateTime.parse(json['issueDate']) : null,
      status: json['status'] as String?,
      shippingCompanyName: json['shippingCompanyName'] as String?,
      packageNumber: json['packageNumber'] as int?,
      grossWeight: json['grossWeight']?.toDouble(),
      netWeight: json['netWeight']?.toDouble(),
      trackingCode: json['trackingCode'] as String?,
      discountPercentage: json['discountPercentage']?.toDouble(),
      quantity: json['quantity']?.toDouble(),
      productValue: json['productValue']?.toDouble(),
      additionalValue: json['additionalValue']?.toDouble(),
      shippingValue: json['shippingValue']?.toDouble(),
      insuranceValue: json['insuranceValue']?.toDouble(),
      ipiValue: json['ipiValue']?.toDouble(),
      totalValue: json['totalValue']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'integrationId': integrationId,
      'orderCode': orderCode,
      'branchCode': branchCode,
      'sequence': sequence,
      'accessKey': accessKey,
      'code': code,
      'serial': serial,
      'issueDate': issueDate?.toIso8601String(),
      'status': status,
      'shippingCompanyName': shippingCompanyName,
      'packageNumber': packageNumber,
      'grossWeight': grossWeight,
      'netWeight': netWeight,
      'trackingCode': trackingCode,
      'discountPercentage': discountPercentage,
      'quantity': quantity,
      'productValue': productValue,
      'additionalValue': additionalValue,
      'shippingValue': shippingValue,
      'insuranceValue': insuranceValue,
      'ipiValue': ipiValue,
      'totalValue': totalValue,
    };
  }
}
