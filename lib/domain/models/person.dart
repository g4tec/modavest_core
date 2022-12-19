import 'package:modavest_core/domain/models/address.dart';
import 'package:modavest_core/domain/models/legal_person_email.dart';
import 'package:modavest_core/domain/models/legal_person_phone.dart';

class Person {
  num? code;
  String? cpf;
  String? image;
  bool? isInactive;
  bool? maritalStatus;
  String? gender;
  String? ctps;
  String? ctpsSerial;
  String? rg;
  String? rgFederalAgency;
  String? motherName;
  String? fatherName;
  String? nationality;
  String? birthDate;
  String? monthlyIncome;
  String? occupation;
  String? hireDate;
  String? workPlace;
  String? homeTown;
  num? branchInsertCode;
  String? name;
  String? homePage;
  String? codeMainRelated;
  String? cpfCnpjMainRelated;
  String? nameMainRelated;
  String? insertDate;
  String? maxChangeFilterDate;
  bool? isCustomer;
  bool? isSupplier;
  bool? isRepresentative;
  bool? isPurchasingGuide;
  bool? isShippingCompany;
  List<Address>? addresses;
  List<LegalPersonPhone>? phones;
  List<LegalPersonEmail>? emails;
  String? observations;
  String? additionalFields;
  String? classifications;
  String? references;
  String? relateds;
  String? shippingCompany;
  String? statistics;

  Person({
    this.code,
    this.cpf,
    this.image,
    this.isInactive,
    this.maritalStatus,
    this.gender,
    this.ctps,
    this.ctpsSerial,
    this.rg,
    this.rgFederalAgency,
    this.motherName,
    this.fatherName,
    this.nationality,
    this.birthDate,
    this.monthlyIncome,
    this.occupation,
    this.hireDate,
    this.workPlace,
    this.homeTown,
    this.branchInsertCode,
    this.name,
    this.homePage,
    this.codeMainRelated,
    this.cpfCnpjMainRelated,
    this.nameMainRelated,
    this.insertDate,
    this.maxChangeFilterDate,
    this.isCustomer,
    this.isSupplier,
    this.isRepresentative,
    this.isPurchasingGuide,
    this.isShippingCompany,
    this.addresses,
    this.phones,
    this.emails,
    this.observations,
    this.additionalFields,
    this.classifications,
    this.references,
    this.relateds,
    this.shippingCompany,
    this.statistics,
  });

  Person copyWith({
    num? code,
    String? cpf,
    String? image,
    bool? isInactive,
    bool? maritalStatus,
    String? gender,
    String? ctps,
    String? ctpsSerial,
    String? rg,
    String? rgFederalAgency,
    String? motherName,
    String? fatherName,
    String? nationality,
    String? birthDate,
    String? monthlyIncome,
    String? occupation,
    String? hireDate,
    String? workPlace,
    String? homeTown,
    num? branchInsertCode,
    String? name,
    String? homePage,
    String? codeMainRelated,
    String? cpfCnpjMainRelated,
    String? nameMainRelated,
    String? insertDate,
    String? maxChangeFilterDate,
    bool? isCustomer,
    bool? isSupplier,
    bool? isRepresentative,
    bool? isPurchasingGuide,
    bool? isShippingCompany,
    List<Address>? addresses,
    List<LegalPersonPhone>? phones,
    List<LegalPersonEmail>? emails,
    String? observations,
    String? additionalFields,
    String? classifications,
    String? references,
    String? relateds,
    String? shippingCompany,
    String? statistics,
  }) {
    return Person(
      code: this.code,
      cpf: cpf ?? this.cpf,
      image: image ?? this.image,
      isInactive: isInactive ?? this.isInactive,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      gender: gender ?? this.gender,
      ctps: ctps ?? this.ctps,
      ctpsSerial: ctpsSerial ?? this.ctpsSerial,
      rg: rg ?? this.rg,
      rgFederalAgency: rgFederalAgency ?? this.rgFederalAgency,
      motherName: motherName ?? this.motherName,
      fatherName: fatherName ?? this.fatherName,
      nationality: nationality ?? this.nationality,
      birthDate: birthDate ?? this.birthDate,
      monthlyIncome: monthlyIncome ?? this.monthlyIncome,
      occupation: occupation ?? this.occupation,
      hireDate: hireDate ?? this.hireDate,
      workPlace: workPlace ?? this.workPlace,
      homeTown: homeTown ?? this.homeTown,
      branchInsertCode: branchInsertCode ?? this.branchInsertCode,
      name: name ?? this.name,
      homePage: homePage ?? this.homePage,
      codeMainRelated: codeMainRelated ?? this.codeMainRelated,
      cpfCnpjMainRelated: cpfCnpjMainRelated ?? this.cpfCnpjMainRelated,
      nameMainRelated: nameMainRelated ?? this.nameMainRelated,
      insertDate: insertDate ?? this.insertDate,
      maxChangeFilterDate: maxChangeFilterDate ?? this.maxChangeFilterDate,
      isCustomer: isCustomer ?? this.isCustomer,
      isSupplier: isSupplier ?? this.isSupplier,
      isRepresentative: isRepresentative ?? this.isRepresentative,
      isPurchasingGuide: isPurchasingGuide ?? this.isPurchasingGuide,
      isShippingCompany: isShippingCompany ?? this.isShippingCompany,
      addresses: addresses ?? this.addresses,
      phones: phones ?? this.phones,
      emails: emails ?? this.emails,
      observations: observations ?? this.observations,
      additionalFields: additionalFields ?? this.additionalFields,
      classifications: classifications ?? this.classifications,
      references: references ?? this.references,
      relateds: relateds ?? this.relateds,
      shippingCompany: shippingCompany ?? this.shippingCompany,
      statistics: statistics ?? this.statistics,
    );
  }
}
