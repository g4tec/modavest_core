import 'package:modavest_core/assets/modavest_states.dart';
import 'package:modavest_core/data/models/address/address_hive.dart';
import 'package:modavest_core/data/models/address/address_model.dart';
import 'package:modavest_core/data/models/category/category_model.dart';
import 'package:modavest_core/data/models/enterprise_reference.dart/enterprise_reference.dart';
import 'package:modavest_core/data/models/enterprise_reference.dart/enterprise_reference_hive.dart';
import 'package:modavest_core/data/models/enterprise_social_network.dart/enterprise_social_network.dart';
import 'package:modavest_core/data/models/enterprise_social_network.dart/enterprise_social_network_hive.dart';
import 'package:modavest_core/data/models/legal_person/legal_person_hive.dart';
import 'package:modavest_core/data/models/legal_person_contact/legal_person_contact.dart';
import 'package:modavest_core/data/models/legal_person_contact/legal_person_contact_hive.dart';
import 'package:modavest_core/data/models/legal_person_email/legal_person_email.dart';
import 'package:modavest_core/data/models/legal_person_email/legal_person_email_hive.dart';
import 'package:modavest_core/data/models/legal_person_phone/legal_person_phone.dart';
import 'package:modavest_core/data/models/legal_person_phone/legal_person_phone_hive.dart';
import 'package:modavest_core/data/models/legal_person_related/legal_person_related_hive.dart';
import 'package:modavest_core/data/models/legal_person_related/legal_person_related_model.dart';
import 'package:modavest_core/domain/models/category.dart';
import 'package:modavest_core/domain/models/enterprise_reference.dart';
import 'package:modavest_core/domain/models/enterprise_social_network.dart';
import 'package:modavest_core/domain/models/legal_person.dart';
import 'package:modavest_core/domain/models/legal_person_contact.dart';
import 'package:modavest_core/domain/models/legal_person_email.dart';
import 'package:modavest_core/domain/models/legal_person_phone.dart';
import 'package:modavest_core/domain/models/legal_person_related.dart';

class LegalPersonModel extends LegalPerson {
  LegalPersonModel({
    bool isSynchronized = true,
    int? code,
    num integrationId = 0,
    String? cnpj,
    bool isInactive = false,
    int branchInsertCode = 1,
    String? name,
    String? fantasyName,
    String? uf,
    required String numberStateRegistration,
    String? dateFoundation,
    String? codeActivity,
    num numberAgents = 0,
    String monthlyInvoicing = "0",
    String shareCapital = "0",
    String? homePage,
    String codeActivityCnae = "0",
    String codeActivityCnae2 = "0",
    String typeTaxRegime = "0",
    String typeSubTributary = "-",
    String typeDescriptionSuFrama = "-",
    String? registrationMunicipal,
    String? descriptionJuntaCial,
    String? dateRegJuntaCial,
    String? codeMainRelated,
    String? cpfCnpjMainRelated,
    String? nameMainRelated,
    String? maxChangeFilterDate,
    String? status,
    required String? insertDate,
    required List<AddressModel> addresses,
    required List<LegalPersonPhone> phones,
    required List<LegalPersonEmail> emails,
    required List<LegalPersonContact> contacts,
    required List<EnterpriseReference> references,
    required List<EnterpriseSocialNetwork> socialNetworks,
    List<Category>? storeSalesStyles,
    List<LegalPersonRelated>? relateds,
  }) : super(
          code: code,
          integrationId: integrationId,
          cnpj: cnpj,
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
          addresses: addresses,
          phones: phones,
          emails: emails,
          isSynchronized: isSynchronized,
          contacts: contacts,
          references: references,
          socialNetworks: socialNetworks,
          storeSalesStyles: storeSalesStyles,
          relateds: relateds,
        );
  factory LegalPersonModel.fromJson(Map json) {
    return LegalPersonModel(
      code: json["code"] as int?,
      integrationId: json["integrationId"] as num? ?? 0,
      cnpj: json["cnpj"] as String?,
      isInactive: json["isInactive"] as bool? ?? false,
      branchInsertCode: json["branchInsertCode"] as int? ?? 1,
      name: json["name"] as String?,
      fantasyName: json["fantasyName"] as String?,
      uf: json["uf"] != null && int.tryParse(json["uf"] as String) != null
          ? states[json["uf"].toString()]
          : json["uf"] as String?,
      numberStateRegistration:
          json["numberStateRegistration"] as String? ?? "-",
      dateFoundation: json["dateFoundation"] as String?,
      codeActivity: json["codeActivity"]?.toString(),
      numberAgents: json["numberAgents"] = json["numberAgents"] is String
          ? int.tryParse(json["numberAgents"] as String? ?? "0")
          : json["numberAgents"] is int
              ? json["numberAgents"]
              : 0,
      monthlyInvoicing: json["monthlyInvoicing"] is String
          ? json["monthlyInvoicing"] as String? ?? "0"
          : json["monthlyInvoicing"] is int
              ? json["monthlyInvoicing"].toString()
              : "0",
      shareCapital: json["shareCapital"] is String
          ? json["shareCapital"] as String? ?? "0"
          : json["shareCapital"] is int
              ? json["shareCapital"].toString()
              : "0",
      homePage: json["homePage"] as String?,
      codeActivityCnae: json["codeActivityCnae"] is String
          ? json["codeActivityCnae"] as String? ?? "0"
          : json["codeActivityCnae"] is int
              ? json["codeActivityCnae"].toString()
              : "0",
      codeActivityCnae2: json["codeActivityCnae2"] is String
          ? json["codeActivityCnae2"] as String? ?? "0"
          : json["codeActivityCnae2"] is int
              ? json["codeActivityCnae2"].toString()
              : "0",
      typeTaxRegime: json["typeTaxRegime"] is String
          ? json["typeTaxRegime"] as String? ?? "0"
          : json["typeTaxRegime"] is int
              ? json["typeTaxRegime"].toString()
              : "0",
      typeSubTributary: json["typeSubTributary"] as String? ?? "-",
      typeDescriptionSuFrama: json["typeDescriptionSuFrama"] as String? ?? "-",
      registrationMunicipal: json["registrationMunicipal"] as String?,
      descriptionJuntaCial: json["descriptionJuntaCial"] as String?,
      dateRegJuntaCial: json["dateRegJuntaCial"] as String?,
      codeMainRelated: json["codeMainRelated"] is int
          ? json["codeMainRelated"].toString()
          : json["codeMainRelated"] as String?,
      cpfCnpjMainRelated: json["cpfCnpjMainRelated"] as String?,
      nameMainRelated: json["nameMainRelated"] as String?,
      maxChangeFilterDate: json["maxChangeFilterDate"] as String?,
      status: json["status"] as String?,
      insertDate: json["insertDate"] as String?,
      addresses: (json["addresses"] as List? ?? [])
          .map((e) => AddressModel.fromJson(e as Map))
          .toList(),
      phones: (json["phones"] as List? ?? [])
          .map(
            (e) => LegalPersonPhoneModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      emails: (json["emails"] as List? ?? [])
          .map(
            (e) => LegalPersonEmailModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      contacts: (json["contacts"] as List? ?? [])
          .map(
            (e) => LegalPersonContactModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      references: (json["references"] as List? ?? [])
          .asMap()
          .map(
            (index, e) => MapEntry(
              index,
              EnterpriseReferenceModel.fromJson(
                e as Map<String, dynamic>,
                index + 1,
              ),
            ),
          )
          .values
          .toList(),
      socialNetworks: (json["socialNetworks"] as List? ?? [])
          .asMap()
          .map(
            (index, e) => MapEntry(
              index,
              EnterpriseSocialNetworkModel.fromJson(
                e as Map<String, dynamic>,
                index,
              ),
            ),
          )
          .values
          .toList(),
      storeSalesStyles: (json["storeSalesStyles"] as List?) != null
          ? (json["storeSalesStyles"] as List? ?? [])
              .asMap()
              .map(
                (index, e) => MapEntry(
                  index,
                  CategoryModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
                ),
              )
              .values
              .toList()
          : null,
      relateds: (json["relateds"] as List? ?? [])
          .map(
            (e) => LegalPersonRelatedModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson({bool noSequence = false}) {
    return {
      "integrationId": integrationId,
      "code": code,
      "cnpj": cnpj,
      "isInactive": isInactive,
      "branchInsertCode": branchInsertCode,
      "name": name ?? (fantasyName ?? "-"),
      "fantasyName": fantasyName,
      "uf": (uf ?? "").length <= 2
          ? uf
          : () {
              try {
                return states.entries
                    .firstWhere(
                      (element) => element.value == uf || element.key == uf,
                    )
                    .key;
              } catch (e) {
                return null;
              }
            }.call(),
      "numberStateRegistration": numberStateRegistration,
      "dateFoundation-": dateFoundation,
      "codeActivity": codeActivity != null ? int.tryParse(codeActivity!) : null,
      "numberAgents": numberAgents,
      "numberEmployees": 0,
      "monthlyInvoicing": int.tryParse(monthlyInvoicing),
      "shareCapital": int.tryParse(shareCapital),
      "homePage": homePage,
      "codeActivityCnae": int.tryParse(codeActivityCnae) ?? 1,
      "codeActivityCnae2": int.tryParse(codeActivityCnae2) ?? 1,
      "typeTaxRegime": num.tryParse(typeTaxRegime) ?? 1,
      "typeSubTributary": typeSubTributary,
      "typeDescriptionSuFrama": typeDescriptionSuFrama,
      "registrationMunicipal": registrationMunicipal,
      "descriptionJuntaCial": descriptionJuntaCial,
      "dateRegJuntaCial": dateRegJuntaCial,
      "codeMainRelated":
          codeMainRelated != null ? int.tryParse(codeMainRelated!) : null,
      "cpfCnpjMainRelated": cpfCnpjMainRelated,
      "nameMainRelated": nameMainRelated,
      "maxChangeFilterDate": maxChangeFilterDate,
      "status": status,
      "insertDate": insertDate,
      "addresses": addresses
          .map((e) => (e as AddressModel).toJson(noSequence: noSequence))
          .toList(),
      "phones": phones
          .map(
            (e) =>
                LegalPersonPhoneModel.entitie(e).toJson(noSequence: noSequence),
          )
          .toList(),
      "emails": emails
          .map(
            (e) =>
                LegalPersonEmailModel.entitie(e).toJson(noSequence: noSequence),
          )
          .toList(),
      "contacts": contacts
          .map(
            (e) => LegalPersonContactModel.entitie(e).toJson(
              integrationIdParam: integrationId,
              legalPersonCodeParam: code,
              noSequence: noSequence,
            ),
          )
          .toList(),
      "references": references
          .map(
            (e) => EnterpriseReferenceModel.entitie(e).toJson(
              integrationIdParam: integrationId,
              legalPersonCodeParam: code,
              noSequence: noSequence,
            ),
          )
          .toList(),
      "socialNetworks": socialNetworks
          .map(
            (e) => EnterpriseSocialNetworkModel.entitie(e).toJson(
              integrationIdParam: integrationId,
              legalPersonCodeParam: code,
              noSequence: noSequence,
            ),
          )
          .toList(),
      "storeSalesStyles": storeSalesStyles
          ?.map(
            (e) => CategoryModel.entitie(e).toJson(isSubcategory: true),
          )
          .toList(),
    };
  }

  factory LegalPersonModel.entitie(LegalPerson legalPerson) {
    return LegalPersonModel(
      code: legalPerson.code,
      cnpj: legalPerson.cnpj,
      isInactive: legalPerson.isInactive,
      branchInsertCode: legalPerson.branchInsertCode,
      name: legalPerson.name,
      fantasyName: legalPerson.fantasyName,
      uf: legalPerson.uf,
      numberStateRegistration: legalPerson.numberStateRegistration,
      dateFoundation: legalPerson.dateFoundation,
      codeActivity: legalPerson.codeActivity,
      numberAgents: legalPerson.numberAgents,
      monthlyInvoicing: legalPerson.monthlyInvoicing,
      shareCapital: legalPerson.shareCapital,
      homePage: legalPerson.homePage,
      codeActivityCnae: legalPerson.codeActivityCnae,
      codeActivityCnae2: legalPerson.codeActivityCnae2,
      typeTaxRegime: legalPerson.typeTaxRegime,
      typeSubTributary: legalPerson.typeSubTributary,
      typeDescriptionSuFrama: legalPerson.typeDescriptionSuFrama,
      registrationMunicipal: legalPerson.registrationMunicipal,
      descriptionJuntaCial: legalPerson.descriptionJuntaCial,
      dateRegJuntaCial: legalPerson.dateRegJuntaCial,
      codeMainRelated: legalPerson.codeMainRelated,
      cpfCnpjMainRelated: legalPerson.cpfCnpjMainRelated,
      nameMainRelated: legalPerson.nameMainRelated,
      maxChangeFilterDate: legalPerson.maxChangeFilterDate,
      status: legalPerson.status,
      insertDate: legalPerson.insertDate,
      addresses:
          legalPerson.addresses.map((e) => AddressModel.entitie(e)).toList(),
      phones: legalPerson.phones,
      emails: legalPerson.emails,
      isSynchronized: legalPerson.isSynchronized,
      contacts: legalPerson.contacts,
      references: legalPerson.references,
      socialNetworks: legalPerson.socialNetworks,
      storeSalesStyles: legalPerson.storeSalesStyles
          ?.map((e) => CategoryModel.entitie(e))
          .toList(),
      relateds: legalPerson.relateds
          ?.map((e) => LegalPersonRelatedModel.entitie(e))
          .toList(),
    );
  }

  HiveLegalPerson toHive() {
    return HiveLegalPerson(
      code: code,
      cnpj: cnpj,
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
      isSynchronized: isSynchronized,
    );
  }

  factory LegalPersonModel.fromHive(HiveLegalPerson hiveLegalPerson) {
    return LegalPersonModel(
      code: hiveLegalPerson.code,
      cnpj: hiveLegalPerson.cnpj,
      isInactive: hiveLegalPerson.isInactive,
      branchInsertCode: hiveLegalPerson.branchInsertCode,
      name: hiveLegalPerson.name,
      fantasyName: hiveLegalPerson.fantasyName,
      uf: hiveLegalPerson.uf,
      numberStateRegistration: hiveLegalPerson.numberStateRegistration,
      dateFoundation: hiveLegalPerson.dateFoundation,
      codeActivity: hiveLegalPerson.codeActivity,
      numberAgents: hiveLegalPerson.numberAgents,
      monthlyInvoicing: hiveLegalPerson.monthlyInvoicing,
      shareCapital: hiveLegalPerson.shareCapital,
      homePage: hiveLegalPerson.homePage,
      codeActivityCnae: hiveLegalPerson.codeActivityCnae,
      codeActivityCnae2: hiveLegalPerson.codeActivityCnae2,
      typeTaxRegime: hiveLegalPerson.typeTaxRegime,
      typeSubTributary: hiveLegalPerson.typeSubTributary,
      typeDescriptionSuFrama: hiveLegalPerson.typeDescriptionSuFrama,
      registrationMunicipal: hiveLegalPerson.registrationMunicipal,
      descriptionJuntaCial: hiveLegalPerson.descriptionJuntaCial,
      dateRegJuntaCial: hiveLegalPerson.dateRegJuntaCial,
      codeMainRelated: hiveLegalPerson.codeMainRelated,
      cpfCnpjMainRelated: hiveLegalPerson.cpfCnpjMainRelated,
      nameMainRelated: hiveLegalPerson.nameMainRelated,
      maxChangeFilterDate: hiveLegalPerson.maxChangeFilterDate,
      status: hiveLegalPerson.status,
      insertDate: hiveLegalPerson.insertDate,
      isSynchronized: hiveLegalPerson.isSynchronized,
      addresses: hiveLegalPerson.addresses != null
          ? hiveLegalPerson.addresses!
              .map(
                (HiveAddress hiveAddress) => AddressModel.fromHive(hiveAddress),
              )
              .toList()
          : [],
      phones: hiveLegalPerson.phones != null
          ? hiveLegalPerson.phones!
              .map(
                (HiveLegalPersonPhone hiveLegalPersonPhone) =>
                    LegalPersonPhoneModel.fromHive(hiveLegalPersonPhone),
              )
              .toList()
          : [],
      emails: hiveLegalPerson.emails != null
          ? hiveLegalPerson.emails!
              .map(
                (HiveLegalPersonEmail hiveLegalPersonEmail) =>
                    LegalPersonEmailModel.fromHive(hiveLegalPersonEmail),
              )
              .toList()
          : [],
      contacts: hiveLegalPerson.contacts != null
          ? hiveLegalPerson.contacts!
              .map(
                (HiveLegalPersonContact hiveLegalPersonContact) =>
                    LegalPersonContactModel.fromHive(hiveLegalPersonContact),
              )
              .toList()
          : [],
      references: hiveLegalPerson.references != null
          ? hiveLegalPerson.references!
              .map(
                (HiveEnterpriseReference hiveEnterpriseReference) =>
                    EnterpriseReferenceModel.fromHive(hiveEnterpriseReference),
              )
              .toList()
          : [],
      socialNetworks: hiveLegalPerson.socialNetworks != null
          ? hiveLegalPerson.socialNetworks!
              .map(
                (HiveEnterpriseSocialNetwork hiveEnterpriseSocialNetwork) =>
                    EnterpriseSocialNetworkModel.fromHive(
                  hiveEnterpriseSocialNetwork,
                ),
              )
              .toList()
          : [],
      relateds: hiveLegalPerson.relateds != null
          ? hiveLegalPerson.relateds!
              .map(
                (HiveLegalPersonRelated hiveAddress) =>
                    LegalPersonRelatedModel.fromHive(hiveAddress),
              )
              .toList()
          : [],
    );
  }
}
