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
}
