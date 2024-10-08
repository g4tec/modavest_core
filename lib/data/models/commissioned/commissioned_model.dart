import 'package:modavest_core/domain/models/commissioned.dart';

class CommissionedModel extends Commissioned {
  CommissionedModel({
    super.orderCode,
    super.integrationId,
    super.representativeCode,
    super.representativeName,
    super.commissionPercentageBilling,
    super.commissionPercentageReceipt,
    super.commissionedType,
  });

  factory CommissionedModel.fromJson(Map<String, dynamic> json) {
    return CommissionedModel(
      orderCode: json['orderCode'] as int?,
      integrationId: json['integrationId'] as int?,
      representativeCode: json['representativeCode'] as int?,
      representativeName: json['representativeName'] as String?,
      commissionPercentageBilling:
          json['commissionPercentageBilling']?.toDouble(),
      commissionPercentageReceipt:
          json['commissionPercentageReceipt']?.toDouble(),
      commissionedType: json['commissionedType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderCode': orderCode,
      'integrationId': integrationId,
      'representativeCode': representativeCode,
      'representativeName': representativeName,
      'commissionPercentageBilling': commissionPercentageBilling,
      'commissionPercentageReceipt': commissionPercentageReceipt,
      'commissionedType': commissionedType,
    };
  }
}
