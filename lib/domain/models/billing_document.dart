import 'package:modavest_core/domain/models/check.dart';

class BillingDocument {
  final int integrationId;
  final int? branchCode;
  final int? customerCode;
  final String? customerCpfCnpj;
  final int receivableCode;
  final int? installmentCode;
  final DateTime? maxChangeFilterDate;
  final DateTime expiredDate;
  final DateTime? paymentDate;
  final DateTime issueDate;
  final DateTime? settlementDate;
  final int status;
  final int documentType;
  final int billingType;
  final int dischargeType;
  final int chargeType;
  final int? originInstallment;
  final int? bearerCode;
  final String? bearerName;
  final num? installmentValue;
  final num? paidValue;
  final num? netValue;
  final num? discountValue;
  final num? rebateValue;
  final num? interestValue;
  final num? assessmentValue;
  final String? barCode;
  final String? digitableLine;
  final String? ourNumber;
  final String? dacOurNumber;
  final Check? check;

  BillingDocument({
    required this.integrationId,
    this.branchCode,
    this.customerCode,
    this.customerCpfCnpj,
    required this.receivableCode,
    this.installmentCode,
    this.maxChangeFilterDate,
    required this.expiredDate,
    this.paymentDate,
    required this.issueDate,
    this.settlementDate,
    required this.status,
    required this.documentType,
    required this.billingType,
    required this.dischargeType,
    required this.chargeType,
    this.originInstallment,
    this.bearerCode,
    this.bearerName,
    this.installmentValue,
    this.paidValue,
    this.netValue,
    this.discountValue,
    this.rebateValue,
    this.interestValue,
    this.assessmentValue,
    this.barCode,
    this.digitableLine,
    this.ourNumber,
    this.dacOurNumber,
    this.check,
  });
}
