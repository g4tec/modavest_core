import 'package:modavest_core/domain/models/address.dart';
import 'package:modavest_core/domain/models/category.dart';

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
  String? dateOfBirth;
  String? maritalStatus;
  String? nationality;
  String? occupation;
  num income;
  String? status;
  String? maxChangeFilterDate;
  String? insertDate;
  List<Address> addresses;

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
    this.dateOfBirth,
    this.maritalStatus,
    this.nationality,
    this.occupation,
    this.income = 0,
    this.status,
    this.maxChangeFilterDate,
    required this.insertDate,
    required this.addresses,
    this.isSynchronized = true,
  });

  Individual copyWith({
    List<Address>? addresses,
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
      dateOfBirth: dateOfBirth,
      maritalStatus: maritalStatus,
      nationality: nationality,
      occupation: occupation,
      income: income,
      status: status,
      maxChangeFilterDate: maxChangeFilterDate,
      insertDate: insertDate,
      addresses: addresses ?? this.addresses,
      isSynchronized: isSynchronized,
    );
  }
}
