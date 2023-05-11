import 'package:modavest_core/assets/modavest_type_code.dart';
import 'package:modavest_core/data/models/address/address_hive.dart';
import 'package:modavest_core/domain/models/address.dart';
import 'package:modavest_core/domain/models/position_coordinates.dart';

class AddressModel extends Address {
  AddressModel({
    String? publicPlace,
    num? number,
    String? complement,
    required String? neighborhood,
    required String cityName,
    String? stateAbbreviation,
    required String cep,
    required String countryName,
    String? reference,
    int branchInsertCode = 1,
    num addressType = 1,
    required String address,
    num? integrationId,
    num? sequence,
  }) : super(
          publicPlace: publicPlace,
          number: number,
          complement: complement,
          neighborhood: neighborhood,
          cityName: cityName,
          stateAbbreviation: stateAbbreviation,
          cep: cep,
          countryName: countryName,
          reference: reference,
          branchInsertCode: branchInsertCode,
          addressType: addressType,
          address: address,
          integrationId: integrationId,
          sequence: sequence,
        );
  factory AddressModel.fromJson(Map json) {
    return AddressModel(
      publicPlace: json["publicPlace"] as String?,
      number: json["number"] as num? ?? json["addressNumber"] as num?,
      complement: json["complement"] as String?,
      neighborhood: json["neighborhood"] as String?,
      cityName: json["cityName"] as String,
      stateAbbreviation: (json["stateAbbreviation"] as String?) ??
          (json["stateAbbreviation"] as String?),
      cep: json["cep"] as String,
      countryName: json["countryName"] as String,
      reference: json["reference"] as String?,
      branchInsertCode: json["branchInsertCode"] as int? ?? 0,
      addressType: json["addressType"] is String
          ? addressFromStringTypes[json["addressType"]] ?? 5
          : json["addressType"] as num? ?? 1,
      address: json["address"] as String? ?? "-",
      integrationId: json["integrationId"] as num?,
      sequence: json["sequence"] as num?,
    );
  }

  factory AddressModel.fromHive(HiveAddress hiveAddress) {
    return AddressModel(
      publicPlace: hiveAddress.publicPlace,
      number: hiveAddress.number,
      complement: hiveAddress.complement,
      neighborhood: hiveAddress.neighborhood,
      cityName: hiveAddress.cityName,
      stateAbbreviation: hiveAddress.stateAbbreviation,
      cep: hiveAddress.cep,
      countryName: hiveAddress.countryName,
      reference: hiveAddress.reference,
      branchInsertCode: hiveAddress.branchInsertCode,
      addressType: hiveAddress.addressType,
      address: hiveAddress.address,
    );
  }

  HiveAddress toHive() {
    return HiveAddress(
      publicPlace: publicPlace,
      number: number,
      complement: complement,
      neighborhood: neighborhood,
      cityName: cityName,
      stateAbbreviation: stateAbbreviation,
      cep: cep,
      countryName: countryName,
      reference: reference,
      branchInsertCode: branchInsertCode,
      addressType: addressType,
      address: address,
    );
  }

  factory AddressModel.entite(Address address) {
    return AddressModel(
      publicPlace: address.publicPlace,
      number: address.number,
      complement: address.complement,
      neighborhood: address.neighborhood,
      cityName: address.cityName,
      stateAbbreviation: address.stateAbbreviation,
      cep: address.cep,
      countryName: address.countryName,
      reference: address.reference,
      branchInsertCode: address.branchInsertCode,
      addressType: address.addressType,
      address: address.address,
      integrationId: address.integrationId,
      sequence: address.sequence,
    );
  }

  Map<String, dynamic> toJson({
    PositionCoordinates? positionCoordinates,
    bool noSequence = false,
    num? integrationId,
  }) {
    final Map<String, dynamic> data = {
      "publicPlace": publicPlace ?? "",
      "number": number,
      "addressNumber": number,
      "complement": complement ?? "",
      "neighborhood": neighborhood ?? "",
      "cityName": cityName,
      "stateAbbreviation": stateAbbreviation,
      "uf": stateAbbreviation ?? "",
      "cep": cep,
      "countryName": countryName,
      "reference": reference ?? "",
      "branchInsertCode": branchInsertCode,
      "addressType": addressType,
      "address": address,
      "integrationId": integrationId ?? this.integrationId,
      "latitude": positionCoordinates?.latitude ?? "",
      "longitude": positionCoordinates?.longitude ?? "",
      "accuracy": positionCoordinates?.accuracy ?? "",
    };

    if (noSequence) {
      return data;
    }
    data.putIfAbsent("sequence", () => sequence);
    return data;
  }
}
