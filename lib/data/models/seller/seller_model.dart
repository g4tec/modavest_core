import 'package:modavest_core/data/models/person/person_model.dart';
import 'package:modavest_core/domain/models/seller.dart';

class SellerModel extends Seller {
  SellerModel({
    required super.sellerCode,
    required super.integrationId,
    required super.name,
    required super.personCode,
    required super.personName,
    required super.photoUrl,
    required super.canMakeToOrder,
    required super.canDeliveryImmediately,
    required super.canCheckFinance,
    required super.cpf,
    required super.maxChangeFilterDate,
    super.person,
  });

  factory SellerModel.fromJson(Map json) {
    return SellerModel(
      sellerCode: json["sellerCode"],
      integrationId: json["integrationId"],
      name: json["sellerName"] as String?,
      personCode: json["personCode"] as int?,
      personName: json["personName"] as String?,
      photoUrl: json["photoUrl"] as String?,
      canMakeToOrder: json["canMakeToOrder"] as bool?,
      canDeliveryImmediately: json["canDeliveryImmediately"] as bool?,
      canCheckFinance: json["canCheckFinance"] as bool?,
      cpf: json["cpf"] as String?,
      maxChangeFilterDate: json["maxChangeFilterDate"] as String?,
      person: json["person"] != null
          ? PersonModel.fromJson(json["person"] as Map<String, dynamic>)
          : null,
    );
  }

  factory SellerModel.entity(Seller seller) {
    return SellerModel(
      sellerCode: seller.sellerCode,
      integrationId: seller.integrationId,
      name: seller.name,
      personCode: seller.personCode,
      personName: seller.personName,
      photoUrl: seller.photoUrl,
      canMakeToOrder: seller.canMakeToOrder,
      canDeliveryImmediately: seller.canDeliveryImmediately,
      canCheckFinance: seller.canCheckFinance,
      cpf: seller.cpf,
      maxChangeFilterDate: seller.maxChangeFilterDate,
    );
  }

  Map toJson() {
    return {
      "sellerCode": sellerCode,
      "integrationId": integrationId,
      "sellerName": name,
      "personCode": personCode,
      "personName": personName,
      "photoUrl": photoUrl,
      "canMakeToOrder": canMakeToOrder,
      "canDeliveryImmediately": canDeliveryImmediately,
      "canCheckFinance": canCheckFinance,
      "cpf": cpf,
      "maxChangeFilterDate": maxChangeFilterDate,
    };
  }
}
