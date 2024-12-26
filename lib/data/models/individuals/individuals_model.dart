import 'package:modavest_core/data/models/address/address_model.dart';
import 'package:modavest_core/domain/models/individual.dart';

class IndividualModel extends Individual {
  IndividualModel({
    int? code,
    String? cpf,
    required String name,
    String? surname,
    String? gender,
    String? dateOfBirth,
    String? maritalStatus,
    String? nationality,
    String? occupation,
    num income = 0,
    required List<AddressModel> addresses,
    bool isInactive = false,
    int branchInsertCode = 1,
    num integrationId = 0,
    String? uf,
    String? status,
    String? maxChangeFilterDate,
    required String insertDate,
    bool isSynchronized = true,
  }) : super(
          code: code,
          cpf: cpf,
          name: name,
          surname: surname,
          gender: gender,
          dateOfBirth: dateOfBirth,
          maritalStatus: maritalStatus,
          nationality: nationality,
          occupation: occupation,
          income: income,
          addresses: addresses,
          isInactive: isInactive,
          branchInsertCode: branchInsertCode,
          integrationId: integrationId,
          uf: uf,
          status: status,
          maxChangeFilterDate: maxChangeFilterDate,
          insertDate: insertDate,
          isSynchronized: isSynchronized,
        );

  factory IndividualModel.fromJson(Map<String, dynamic> json) {
    return IndividualModel(
      code: json["code"] as int?,
      cpf: json["cpf"] as String?,
      name: json["name"] as String,
      surname: json["surname"] as String?,
      gender: json["gender"] as String?,
      dateOfBirth: json["dateOfBirth"] as String?,
      maritalStatus: json["maritalStatus"] as String?,
      nationality: json["nationality"] as String?,
      occupation: json["occupation"] as String?,
      income: json["income"] as num? ?? 0,
      addresses: (json["addresses"] as List? ?? [])
          .map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isInactive: json["isInactive"] as bool? ?? false,
      branchInsertCode: json["branchInsertCode"] as int? ?? 1,
      integrationId: json["integrationId"] as num? ?? 0,
      uf: json["uf"] as String?,
      status: json["status"] as String?,
      maxChangeFilterDate: json["maxChangeFilterDate"] as String?,
      insertDate: json["insertDate"] as String,
      isSynchronized: json["isSynchronized"] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "cpf": cpf,
      "name": name,
      "surname": surname,
      "gender": gender,
      "dateOfBirth": dateOfBirth,
      "maritalStatus": maritalStatus,
      "nationality": nationality,
      "occupation": occupation,
      "income": income,
      "addresses": addresses.map((e) => (e as AddressModel).toJson()).toList(),
      "isInactive": isInactive,
      "branchInsertCode": branchInsertCode,
      "integrationId": integrationId,
      "uf": uf,
      "status": status,
      "maxChangeFilterDate": maxChangeFilterDate,
      "insertDate": insertDate,
      "isSynchronized": isSynchronized,
    };
  }
}
