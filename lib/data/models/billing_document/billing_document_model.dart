import 'package:modavest_core/data/models/check/check_model.dart';
import 'package:modavest_core/domain/models/billing_document.dart';
import 'package:modavest_core/domain/models/check.dart';

class BillingDocumentModel extends BillingDocument {
  BillingDocumentModel({
    required int integrationId,
    int? branchCode,
    int? customerCode,
    String? customerCpfCnpj,
    required int receivableCode,
    int? installmentCode,
    DateTime? maxChangeFilterDate,
    required DateTime expiredDate,
    DateTime? paymentDate,
    required DateTime issueDate,
    DateTime? settlementDate,
    required int status,
    required int documentType,
    required int billingType,
    required int dischargeType,
    required int chargeType,
    int? originInstallment,
    int? bearerCode,
    String? bearerName,
    num? installmentValue,
    num? paidValue,
    num? netValue,
    num? discountValue,
    num? rebateValue,
    num? interestValue,
    num? assessmentValue,
    String? barCode,
    String? digitableLine,
    String? ourNumber,
    String? dacOurNumber,
    Check? check,
  }) : super(
          integrationId: integrationId,
          branchCode: branchCode,
          customerCode: customerCode,
          customerCpfCnpj: customerCpfCnpj,
          receivableCode: receivableCode,
          installmentCode: installmentCode,
          maxChangeFilterDate: maxChangeFilterDate,
          expiredDate: expiredDate,
          paymentDate: paymentDate,
          issueDate: issueDate,
          settlementDate: settlementDate,
          status: status,
          documentType: documentType,
          billingType: billingType,
          dischargeType: dischargeType,
          chargeType: chargeType,
          originInstallment: originInstallment,
          bearerCode: bearerCode,
          bearerName: bearerName,
          installmentValue: installmentValue,
          paidValue: paidValue,
          netValue: netValue,
          discountValue: discountValue,
          rebateValue: rebateValue,
          interestValue: interestValue,
          assessmentValue: assessmentValue,
          barCode: barCode,
          digitableLine: digitableLine,
          ourNumber: ourNumber,
          dacOurNumber: dacOurNumber,
          check: check,
        );

  factory BillingDocumentModel.fromJson(Map json) {
    return BillingDocumentModel(
      integrationId: json["integrationId"] as int,
      branchCode: json["branchCode"] as int?,
      customerCode: json["customerCode"] as int?,
      customerCpfCnpj: json["customerCpfCnpj"] as String?,
      receivableCode: json["receivableCode"] is int
          ? json["receivableCode"] as int
          : json["receivableCode"] is String
              ? int.tryParse(json["receivableCode"] as String) ?? 0
              : 0,
      installmentCode: json["installmentCode"] as int?,
      maxChangeFilterDate: json["maxChangeFilterDate"] != null
          ? DateTime.parse(json["maxChangeFilterDate"] as String)
          : null,
      expiredDate: DateTime.parse(json["expiredDate"] as String),
      paymentDate: json["paymentDate"] != null
          ? DateTime.parse(json["paymentDate"] as String)
          : null,
      issueDate: DateTime.parse(json["issueDate"] as String),
      settlementDate: json["settlementDate"] != null
          ? DateTime.parse(json["settlementDate"] as String)
          : null,
      status: json["status"] as int,
      documentType: json["documentType"] as int,
      billingType: json["billingType"] as int,
      dischargeType: json["dischargeType"] as int,
      chargeType: json["chargeType"] as int,
      originInstallment: json["originInstallment"] as int?,
      bearerCode: json["bearerCode"] as int?,
      bearerName: json["bearerName"] as String?,
      installmentValue: json["installmentValue"] as num?,
      paidValue: json["paidValue"] as num?,
      netValue: json["netValue"] as num?,
      discountValue: json["discountValue"] as num?,
      rebateValue: json["rebateValue"] as num?,
      interestValue: json["interestValue"] as num?,
      assessmentValue: json["assessmentValue"] as num?,
      barCode: json["barCode"] as String?,
      digitableLine: json["digitableLine"] as String?,
      ourNumber: json["ourNumber"] as String?,
      dacOurNumber: json["dacOurNumber"] as String?,
      check: json["check"] != null
          ? CheckModel.fromJson(json["check"] as Map)
          : null,
    );
  }
}
