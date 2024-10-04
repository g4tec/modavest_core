import 'package:modavest_core/domain/models/invoice.dart';

class InvoiceModel extends Invoice {
  InvoiceModel({
    required super.integrationId,
    required super.orderCode,
    required super.branchCode,
    required super.sequence,
    super.accessKey,
    required super.code,
    super.serial,
    required super.issueDate,
    required super.status,
    super.shippingCompanyName,
    super.packageNumber,
    super.grossWeight,
    super.netWeight,
    super.trackingCode,
    super.discountPercentage,
    super.quantity,
    super.productValue,
    super.additionalValue,
    super.shippingValue,
    super.insuranceValue,
    super.ipiValue,
    super.totalValue,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceModel(
      integrationId: json['integrationId'] as int,
      orderCode: json['orderCode'] as int?,
      branchCode: json['branchCode'] as int?,
      sequence: json['sequence'] as int?,
      accessKey: json['accessKey'] as String?,
      code: json['code'] as int?,
      serial: json['serial'] as String?,
      issueDate:
          json['issueDate'] != null ? DateTime.parse(json['issueDate']) : null,
      status: json['status'] as String,
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
}
