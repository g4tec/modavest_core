import 'package:modavest_core/data/models/freightQuote/freight_quotes_hive.dart';
import 'package:modavest_core/domain/models/freight_quotes.dart';

class FreightQuoteModel extends FreightQuote {
  FreightQuoteModel({
    required super.freightValue,
    required super.shippingCompanyCpfCnpj,
    required super.shippingCompanyName,
    required super.deliveryEstimateBusinessDays,
    required super.deliveryMethodName,
    required super.shippingCompanyCode,
  });

  factory FreightQuoteModel.fromJson(Map<String, dynamic> json) {
    return FreightQuoteModel(
      freightValue: json['freightValue'] as num,
      shippingCompanyCpfCnpj: json['shippingCompanyCpfCnpj'] as String? ?? '',
      shippingCompanyName: json['shippingCompanyName'] as String,
      deliveryEstimateBusinessDays: json['deliveryEstimateBusinessDays'] as num,
      deliveryMethodName: json['deliveryMethodName'] as String,
      shippingCompanyCode: json['shippingCompanyCode'] as num?,
    );
  }

  factory FreightQuoteModel.fromHive(HiveFreightQuote freightHive) {
    return FreightQuoteModel(
      freightValue: freightHive.freightValue,
      shippingCompanyCpfCnpj: freightHive.shippingCompanyCpfCnpj,
      shippingCompanyName: freightHive.shippingCompanyName,
      deliveryEstimateBusinessDays: freightHive.deliveryEstimateBusinessDays,
      deliveryMethodName: freightHive.deliveryMethodName,
      shippingCompanyCode: freightHive.shippingCompanyCode,
    );
  }

  factory FreightQuoteModel.entity(FreightQuote freightHive) {
    return FreightQuoteModel(
      freightValue: freightHive.freightValue,
      shippingCompanyCpfCnpj: freightHive.shippingCompanyCpfCnpj,
      shippingCompanyName: freightHive.shippingCompanyName,
      deliveryEstimateBusinessDays: freightHive.deliveryEstimateBusinessDays,
      deliveryMethodName: freightHive.deliveryMethodName,
      shippingCompanyCode: freightHive.shippingCompanyCode,
    );
  }

  HiveFreightQuote toHive() {
    return HiveFreightQuote(
      freightValue: freightValue,
      shippingCompanyCpfCnpj: shippingCompanyCpfCnpj,
      shippingCompanyName: shippingCompanyName,
      deliveryEstimateBusinessDays: deliveryEstimateBusinessDays,
      deliveryMethodName: deliveryMethodName,
      shippingCompanyCode: shippingCompanyCode,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "freightValue": freightValue,
      "shippingCompanyCpfCnpj": shippingCompanyCpfCnpj,
      "deliveryEstimateBusinessDays": deliveryEstimateBusinessDays,
      "deliveryMethodName": deliveryMethodName,
      "shippingCompanyCode": shippingCompanyCode,
    };
  }
}
