import 'package:hive_flutter/hive_flutter.dart';
import 'package:modavest_core/data/models/address/address_hive.dart';

part 'individuals_hive.g.dart';

@HiveType(typeId: 53)
class HiveIndividual extends HiveObject {
  @HiveField(0)
  int? code;
  @HiveField(1)
  String? cpf;
  @HiveField(2)
  bool isInactive;
  @HiveField(3)
  int branchInsertCode;
  @HiveField(4)
  String? name;
  @HiveField(5)
  String? surname;
  @HiveField(6)
  String? uf;
  @HiveField(7)
  String? gender;
  @HiveField(8)
  String? dateOfBirth;
  @HiveField(9)
  String? maritalStatus;
  @HiveField(10)
  String? nationality;
  @HiveField(11)
  String? occupation;
  @HiveField(12)
  num income;
  @HiveField(13)
  String? status;
  @HiveField(14)
  String? maxChangeFilterDate;
  @HiveField(15)
  String? insertDate;
  @HiveField(16)
  HiveList<HiveAddress>? addresses;
  @HiveField(17)
  bool isSynchronized;
  @HiveField(18)
  num integrationId;

  HiveIndividual({
    this.code,
    this.cpf,
    this.isInactive = false,
    this.branchInsertCode = 1,
    this.name,
    this.surname,
    this.uf,
    this.gender,
    this.dateOfBirth,
    this.maritalStatus,
    this.nationality,
    this.occupation,
    this.income = 0,
    this.status,
    this.maxChangeFilterDate,
    required this.insertDate,
    this.addresses,
    this.isSynchronized = true,
    this.integrationId = 0,
  });
}
