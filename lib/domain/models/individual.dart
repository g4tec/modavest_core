import 'package:modavest_core/domain/models/address.dart';
import 'package:modavest_core/domain/models/enterprise_reference.dart';
import 'package:modavest_core/domain/models/legal_person_email.dart';
import 'package:modavest_core/domain/models/legal_person_phone.dart';

class Individual {
  bool isSynchronized;
  int? code;
  num integrationId;
  String? cpf;
  bool isInactive;
  int branchInsertCode;
  String? name;
  String? surname;
  String? uf;
  String? gender;
  String? birthDate;
  String? maritalStatus;
  String? nationality;
  String? occupation;
  num monthlyIncome;
  String? status;
  String? maxChangeFilterDate;
  String? insertDate;
  List<Address> addresses;
  List<LegalPersonPhone> phones;
  List<LegalPersonEmail> emails;
  List<EnterpriseReference> references;

  Individual({
    this.code,
    this.cpf,
    this.integrationId = 0,
    this.isInactive = false,
    this.branchInsertCode = 1,
    this.name,
    this.surname,
    this.uf,
    this.gender,
    this.birthDate,
    this.maritalStatus,
    this.nationality,
    this.occupation,
    this.monthlyIncome = 0,
    this.status,
    this.maxChangeFilterDate,
    required this.insertDate,
    required this.addresses,
    required this.phones,
    required this.emails,
    required this.references,
    this.isSynchronized = true,
  });

  Individual copyWith({
    List<Address>? addresses,
    List<LegalPersonPhone>? phones,
    List<LegalPersonEmail>? emails,
    List<EnterpriseReference>? references,
  }) {
    return Individual(
      code: code,
      cpf: cpf,
      integrationId: integrationId,
      isInactive: isInactive,
      branchInsertCode: branchInsertCode,
      name: name,
      surname: surname,
      uf: uf,
      gender: gender,
      birthDate: birthDate,
      maritalStatus: maritalStatus,
      nationality: nationality,
      occupation: occupation,
      monthlyIncome: monthlyIncome,
      status: status,
      maxChangeFilterDate: maxChangeFilterDate,
      insertDate: insertDate,
      addresses: addresses ?? this.addresses,
      phones: phones ?? this.phones,
      emails: emails ?? this.emails,
      references: references ?? this.references,
      isSynchronized: isSynchronized,
    );
  }
}
