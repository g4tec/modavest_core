import 'package:modavest_core/domain/models/address.dart';
import 'package:modavest_core/domain/models/category.dart';
import 'package:modavest_core/domain/models/enterprise_reference.dart';
import 'package:modavest_core/domain/models/enterprise_social_network.dart';
import 'package:modavest_core/domain/models/legal_person_contact.dart';
import 'package:modavest_core/domain/models/legal_person_email.dart';
import 'package:modavest_core/domain/models/legal_person_phone.dart';
import 'package:modavest_core/domain/models/legal_person_related.dart';

class LegalPerson {
  bool isSynchronized;
  int? code;
  num integrationId;
  String? cnpj;
  bool isInactive;
  int branchInsertCode;
  String? name;
  String? fantasyName;
  String? uf;
  String numberStateRegistration;
  String? dateFoundation;
  String? codeActivity;
  num numberAgents;
  String monthlyInvoicing;
  String shareCapital;
  String? homePage;
  String codeActivityCnae;
  String codeActivityCnae2;
  String typeTaxRegime;
  String typeSubTributary;
  String typeDescriptionSuFrama;
  String? registrationMunicipal;
  String? descriptionJuntaCial;
  String? dateRegJuntaCial;
  String? codeMainRelated;
  String? cpfCnpjMainRelated;
  String? nameMainRelated;
  String? maxChangeFilterDate;
  String? status;
  String? insertDate;
  List<Address> addresses;
  List<LegalPersonPhone> phones;
  List<LegalPersonEmail> emails;
  List<LegalPersonContact> contacts;
  List<EnterpriseReference> references;
  List<EnterpriseSocialNetwork> socialNetworks;
  List<Category>? storeSalesStyles;
  List<LegalPersonRelated>? relateds;

  LegalPerson({
    this.code,
    this.cnpj,
    this.integrationId = 0,
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
    required this.addresses,
    required this.phones,
    required this.emails,
    required this.contacts,
    this.isSynchronized = true,
    required this.references,
    required this.socialNetworks,
    this.storeSalesStyles,
    this.relateds,
  });

  LegalPerson copyWith({List<Address>? addresses}) {
    return LegalPerson(
      code: code,
      cnpj: cnpj,
      integrationId: integrationId,
      isInactive: isInactive,
      branchInsertCode: branchInsertCode,
      name: name,
      fantasyName: fantasyName,
      uf: uf,
      numberStateRegistration: numberStateRegistration,
      dateFoundation: dateFoundation,
      codeActivity: codeActivity,
      numberAgents: numberAgents,
      monthlyInvoicing: monthlyInvoicing,
      shareCapital: shareCapital,
      homePage: homePage,
      codeActivityCnae: codeActivityCnae,
      codeActivityCnae2: codeActivityCnae2,
      typeTaxRegime: typeTaxRegime,
      typeSubTributary: typeSubTributary,
      typeDescriptionSuFrama: typeDescriptionSuFrama,
      registrationMunicipal: registrationMunicipal,
      descriptionJuntaCial: descriptionJuntaCial,
      dateRegJuntaCial: dateRegJuntaCial,
      codeMainRelated: codeMainRelated,
      cpfCnpjMainRelated: cpfCnpjMainRelated,
      nameMainRelated: nameMainRelated,
      maxChangeFilterDate: maxChangeFilterDate,
      status: status,
      insertDate: insertDate,
      addresses: addresses ?? this.addresses,
      phones: phones,
      emails: emails,
      contacts: contacts,
      isSynchronized: isSynchronized,
      references: references,
      socialNetworks: socialNetworks,
      storeSalesStyles: storeSalesStyles,
      relateds: relateds,
    );
  }
}
