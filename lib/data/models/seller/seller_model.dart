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
  });

  factory SellerModel.fromJson(Map json) {
    return SellerModel(
      sellerCode: json["sellerCode"],
      integrationId: json["integrationId"],
      name: json["name"],
      personCode: json["personCode"],
      personName: json["personName"],
      photoUrl: json["photoUrl"],
      canMakeToOrder: json["canMakeToOrder"],
      canDeliveryImmediately: json["canDeliveryImmediately"],
      canCheckFinance: json["canCheckFinance"],
      cpf: json["cpf"],
      maxChangeFilterDate: json["maxChangeFilterDate"],
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
      "name": name,
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
