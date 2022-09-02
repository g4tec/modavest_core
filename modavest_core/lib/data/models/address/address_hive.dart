import 'package:hive_flutter/hive_flutter.dart';

part 'address_hive.g.dart';

@HiveType(typeId: 23)
class HiveAddress extends HiveObject {
  @HiveField(0)
  num addressType;
  @HiveField(1)
  final num? integrationId;
  @HiveField(2)
  final String? publicPlace;
  @HiveField(3)
  final String address;
  @HiveField(4)
  final num? number;
  @HiveField(5)
  final String? complement;
  @HiveField(6)
  final String? neighborhood;
  @HiveField(7)
  final num? ibgeCityCode;
  @HiveField(8)
  final String cityName;
  @HiveField(9)
  final String? stateAbbreviation;
  @HiveField(10)
  final String cep;
  @HiveField(11)
  final num? bcbCountryCode;
  @HiveField(12)
  final String countryName;
  @HiveField(13)
  final num? postOfficeBox;
  @HiveField(14)
  final String? reference;
  @HiveField(15)
  final int branchInsertCode;

  HiveAddress({
    this.addressType = 1,
    this.integrationId,
    this.publicPlace,
    required this.address,
    this.number,
    this.complement,
    this.neighborhood,
    this.ibgeCityCode,
    required this.cityName,
    required this.stateAbbreviation,
    required this.cep,
    this.bcbCountryCode,
    this.countryName = "Brasil",
    this.postOfficeBox,
    this.reference,
    this.branchInsertCode = 1,
  });
}
