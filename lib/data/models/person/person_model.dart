import 'package:modavest_core/data/models/address/address_model.dart';
import 'package:modavest_core/data/models/legal_person_email/legal_person_email.dart';
import 'package:modavest_core/data/models/legal_person_phone/legal_person_phone.dart';
import 'package:modavest_core/domain/models/person.dart';

class PersonModel extends Person {
  PersonModel({
    super.code,
    super.cpf,
    super.image,
    super.isInactive,
    super.maritalStatus,
    super.gender,
    super.ctps,
    super.ctpsSerial,
    super.rg,
    super.rgFederalAgency,
    super.motherName,
    super.fatherName,
    super.nationality,
    super.birthDate,
    super.monthlyIncome,
    super.occupation,
    super.hireDate,
    super.workPlace,
    super.homeTown,
    super.branchInsertCode,
    super.name,
    super.homePage,
    super.codeMainRelated,
    super.cpfCnpjMainRelated,
    super.nameMainRelated,
    super.insertDate,
    super.maxChangeFilterDate,
    super.isCustomer,
    super.isSupplier,
    super.isRepresentative,
    super.isPurchasingGuide,
    super.isShippingCompany,
    super.addresses,
    super.phones,
    super.emails,
    super.observations,
    super.additionalFields,
    super.classifications,
    super.references,
    super.relateds,
    super.shippingCompany,
    super.statistics,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      cpf: json["cpf"],
      image: json["image"],
      isInactive: json["isInactive"] is bool ? json["isInactive"] : false,
      maritalStatus: json["maritalStatus"],
      gender: json["gender"],
      ctps: json["ctps"],
      ctpsSerial: json["ctpsSerial"],
      rg: json["rg"],
      rgFederalAgency: json["rgFederalAgency"],
      motherName: json["motherName"],
      fatherName: json["fatherName"],
      nationality: json["nationality"],
      birthDate: json["birthDate"],
      monthlyIncome: json["monthlyIncome"],
      occupation: json["occupation"],
      hireDate: json["hireDate"],
      workPlace: json["workPlace"],
      homeTown: json["homeTown"],
      branchInsertCode: json["branchInsertCode"],
      name: json["name"],
      homePage: json["homePage"],
      codeMainRelated: json["codeMainRelated"],
      cpfCnpjMainRelated: json["cpfCnpjMainRelated"],
      nameMainRelated: json["nameMainRelated"],
      insertDate: json["insertDate"],
      maxChangeFilterDate: json["maxChangeFilterDate"],
      isCustomer: json["isCustomer"],
      isSupplier: json["isSupplier"],
      isRepresentative: json["isRepresentative"],
      isPurchasingGuide: json["isPurchasingGuide"],
      isShippingCompany: json["isShippingCompany"],
      addresses: json["addresses"] != null && json["addresses"] is List
          ? (json["addresses"] as List)
              .map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      phones: json["phones"] != null && json["phones"] is List
          ? (json["phones"] as List)
              .map((e) =>
                  LegalPersonPhoneModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      emails: json["emails"] != null && json["emails"] is List
          ? (json["emails"] as List)
              .map((e) =>
                  LegalPersonEmailModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      observations: json["observations"],
      additionalFields: json["additionalFields"],
      classifications: json["classifications"],
      references: json["references"],
      relateds: json["relateds"],
      shippingCompany: json["shippingCompany"],
      statistics: json["statistics"],
    );
  }

  factory PersonModel.entite(Person person) {
    return PersonModel(
      cpf: person.cpf,
      image: person.image,
      isInactive: person.isInactive,
      maritalStatus: person.maritalStatus,
      gender: person.gender,
      ctps: person.ctps,
      ctpsSerial: person.ctpsSerial,
      rg: person.rg,
      rgFederalAgency: person.rgFederalAgency,
      motherName: person.motherName,
      fatherName: person.fatherName,
      nationality: person.nationality,
      birthDate: person.birthDate,
      monthlyIncome: person.monthlyIncome,
      occupation: person.occupation,
      hireDate: person.hireDate,
      workPlace: person.workPlace,
      homeTown: person.homeTown,
      branchInsertCode: person.branchInsertCode,
      name: person.name,
      homePage: person.homePage,
      codeMainRelated: person.codeMainRelated,
      cpfCnpjMainRelated: person.cpfCnpjMainRelated,
      nameMainRelated: person.nameMainRelated,
      insertDate: person.insertDate,
      maxChangeFilterDate: person.maxChangeFilterDate,
      isCustomer: person.isCustomer,
      isSupplier: person.isSupplier,
      isRepresentative: person.isRepresentative,
      isPurchasingGuide: person.isPurchasingGuide,
      isShippingCompany: person.isShippingCompany,
      addresses: person.addresses?.map((e) => AddressModel.entitie(e)).toList(),
      phones:
          person.phones?.map((e) => LegalPersonPhoneModel.entitie(e)).toList(),
      emails:
          person.emails?.map((e) => LegalPersonEmailModel.entitie(e)).toList(),
      observations: person.observations,
      additionalFields: person.additionalFields,
      classifications: person.classifications,
      references: person.references,
      relateds: person.relateds,
      shippingCompany: person.shippingCompany,
      statistics: person.statistics,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "cpf": cpf,
      "image": image,
      "isInactive": isInactive,
      "maritalStatus": maritalStatus,
      "gender": gender,
      "ctps": ctps,
      "ctpsSerial": ctpsSerial,
      "rg": rg,
      "rgFederalAgency": rgFederalAgency,
      "motherName": motherName,
      "fatherName": fatherName,
      "nationality": nationality,
      "birthDate": birthDate,
      "monthlyIncome": monthlyIncome,
      "occupation": occupation,
      "hireDate": hireDate,
      "workPlace": workPlace,
      "homeTown": homeTown,
      "branchInsertCode": branchInsertCode,
      "name": name,
      "homePage": homePage,
      "codeMainRelated": codeMainRelated,
      "cpfCnpjMainRelated": cpfCnpjMainRelated,
      "nameMainRelated": nameMainRelated,
      "insertDate": insertDate,
      "maxChangeFilterDate": maxChangeFilterDate,
      "isCustomer": isCustomer,
      "isSupplier": isSupplier,
      "isRepresentative": isRepresentative,
      "isPurchasingGuide": isPurchasingGuide,
      "isShippingCompany": isShippingCompany,
      "observations": observations,
      "additionalFields": additionalFields,
      "classifications": classifications,
      "references": references,
      "relateds": relateds,
      "shippingCompany": shippingCompany,
      "statistics": statistics,
      "addresses":
          addresses?.map((e) => AddressModel.entitie(e).toJson()).toList(),
      "phones": phones
          ?.map((e) => LegalPersonPhoneModel.entitie(e).toJson())
          .toList(),
      "emails": emails
          ?.map((e) => LegalPersonEmailModel.entitie(e).toJson())
          .toList(),
    };
  }
}
