import 'package:hive_flutter/hive_flutter.dart';
import 'package:modavest_core/data/models/address/address_hive.dart';
import 'package:modavest_core/data/models/enterprise_reference.dart/enterprise_reference_hive.dart';
import 'package:modavest_core/data/models/enterprise_social_network.dart/enterprise_social_network_hive.dart';
import 'package:modavest_core/data/models/legal_person_contact/legal_person_contact_hive.dart';
import 'package:modavest_core/data/models/legal_person_email/legal_person_email_hive.dart';
import 'package:modavest_core/data/models/legal_person_phone/legal_person_phone_hive.dart';

part 'legal_person_hive.g.dart';

@HiveType(typeId: 21)
class HiveLegalPerson extends HiveObject {
  @HiveField(0)
  int? code;
  @HiveField(1)
  String? cnpj;
  @HiveField(2)
  bool isInactive;
  @HiveField(3)
  int branchInsertCode;
  @HiveField(4)
  String? name;
  @HiveField(5)
  String? fantasyName;
  @HiveField(6)
  String? uf;
  @HiveField(7)
  String numberStateRegistration;
  @HiveField(8)
  String? dateFoundation;
  @HiveField(9)
  String? codeActivity;
  @HiveField(10)
  num numberAgents;
  @HiveField(11)
  String monthlyInvoicing;
  @HiveField(12)
  String shareCapital;
  @HiveField(13)
  String? homePage;
  @HiveField(14)
  String codeActivityCnae;
  @HiveField(15)
  String codeActivityCnae2;
  @HiveField(16)
  String typeTaxRegime;
  @HiveField(17)
  String typeSubTributary;
  @HiveField(18)
  String typeDescriptionSuFrama;
  @HiveField(19)
  String? registrationMunicipal;
  @HiveField(20)
  String? descriptionJuntaCial;
  @HiveField(21)
  String? dateRegJuntaCial;
  @HiveField(22)
  String? codeMainRelated;
  @HiveField(23)
  String? cpfCnpjMainRelated;
  @HiveField(24)
  String? nameMainRelated;
  @HiveField(25)
  String? maxChangeFilterDate;
  @HiveField(26)
  String? status;
  @HiveField(27)
  String? insertDate;
  @HiveField(28)
  HiveList<HiveAddress>? addresses;
  @HiveField(29)
  List<HiveLegalPersonPhone>? phones;
  @HiveField(30)
  List<HiveLegalPersonEmail>? emails;
  @HiveField(31)
  bool isSynchronized;
  @HiveField(32)
  List<HiveLegalPersonContact>? contacts;
  @HiveField(33)
  num? integrationId;
  @HiveField(34)
  List<HiveEnterpriseReference>? references;
  @HiveField(35)
  List<HiveEnterpriseSocialNetwork>? socialNetworks;

  HiveLegalPerson({
    this.code,
    this.cnpj,
    this.isInactive = false,
    this.branchInsertCode = 1,
    this.name,
    this.fantasyName,
    this.uf,
    required this.numberStateRegistration,
    this.dateFoundation,
    this.codeActivity,
    this.numberAgents = 0,
    this.monthlyInvoicing = "0",
    this.shareCapital = "0",
    this.homePage,
    this.codeActivityCnae = "0",
    this.codeActivityCnae2 = "0",
    this.typeTaxRegime = "0",
    this.typeSubTributary = "-",
    this.typeDescriptionSuFrama = "-",
    this.registrationMunicipal,
    this.descriptionJuntaCial,
    this.dateRegJuntaCial,
    this.codeMainRelated,
    this.cpfCnpjMainRelated,
    this.nameMainRelated,
    this.maxChangeFilterDate,
    this.status,
    required this.insertDate,
    this.addresses,
    this.phones,
    this.emails,
    this.contacts,
    this.isSynchronized = true,
    this.socialNetworks,
  });
}
