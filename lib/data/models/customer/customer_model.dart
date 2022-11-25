import 'package:modavest_core/data/models/address/address_model.dart';
import 'package:modavest_core/data/models/customer/customer_hive.dart';
import 'package:modavest_core/domain/models/customer.dart';
import 'package:modavest_core/domain/models/legal_person.dart';

class CustomerModel extends Customer {
  CustomerModel({
    required super.integrationId,
    super.code,
    super.name,
    super.cpfCnpj,
    super.fantasyName,
    super.image,
    required List<AddressModel> super.addresses,
  });

  factory CustomerModel.fromJson(Map json) {
    return CustomerModel(
      integrationId: json["integrationId"] as int,
      code: json["personCode"] as int? ?? json["code"] as int,
      name: json["name"] as String?,
      fantasyName: json["fantasyName"] as String?,
      cpfCnpj: json["cpfCnpj"] as String?,
      addresses: (json["addresses"] as List?)
              ?.map((e) => AddressModel.fromJson(e as Map))
              .toList() ??
          [],
    );
  }

  factory CustomerModel.fromHive(HiveCustomer hive) {
    return CustomerModel(
      integrationId: hive.integrationId,
      code: hive.code,
      name: hive.name,
      cpfCnpj: hive.cpfCnpj,
      fantasyName: hive.fantasyName,
      image: hive.image,
      addresses: [],
    );
  }

  factory CustomerModel.fromLegalPerson(LegalPerson legalPerson) {
    return CustomerModel(
      integrationId: 1,
      name: legalPerson.name ?? legalPerson.fantasyName,
      cpfCnpj: legalPerson.cnpj,
      fantasyName: legalPerson.fantasyName,
      addresses: legalPerson.addresses.map((e) => e as AddressModel).toList(),
    );
  }

  HiveCustomer toHive() {
    return HiveCustomer(
      integrationId: integrationId,
      code: code,
      name: name,
      cpfCnpj: cpfCnpj,
      fantasyName: fantasyName,
      image: image,
    );
  }
}
