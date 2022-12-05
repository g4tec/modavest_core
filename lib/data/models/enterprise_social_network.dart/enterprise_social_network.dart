import 'package:modavest_core/data/models/enterprise_social_network.dart/enterprise_social_network_hive.dart';
import 'package:modavest_core/domain/models/enterprise_social_network.dart';

class EnterpriseSocialNetworkModel extends EnterpriseSocialNetwork {
  EnterpriseSocialNetworkModel({
    required int? sequence,
    num? integrationId,
    String? address,
    num? typeCode,
    String? typeName,
  }) : super(
          sequence: sequence,
          integrationId: integrationId,
          address: address,
          typeCode: typeCode,
          typeName: typeName,
        );
  factory EnterpriseSocialNetworkModel.fromJson(
    Map<String, dynamic> json,
    int? sequence,
  ) {
    return EnterpriseSocialNetworkModel(
      sequence: json["sequence"] as int? ?? sequence ?? 0,
      integrationId: json["integrationId"] as num?,
      address: json["address"] as String?,
      typeCode: json["typeCode"] as num,
      typeName: json["typeName"] as String?,
    );
  }

  factory EnterpriseSocialNetworkModel.fromHive(
    HiveEnterpriseSocialNetwork hiveEnterpriseSocialNetwork,
  ) {
    return EnterpriseSocialNetworkModel(
      sequence: hiveEnterpriseSocialNetwork.sequence,
      integrationId: hiveEnterpriseSocialNetwork.integrationId,
      address: hiveEnterpriseSocialNetwork.address,
      typeCode: hiveEnterpriseSocialNetwork.typeCode,
      typeName: hiveEnterpriseSocialNetwork.typeName,
    );
  }

  HiveEnterpriseSocialNetwork toHive() {
    return HiveEnterpriseSocialNetwork(
      sequence: sequence ?? 0,
      integrationId: integrationId,
      address: address,
      typeCode: typeCode,
      typeName: typeName,
    );
  }

  Map<String, dynamic> toJson({
    num? integrationIdParam,
    num? legalPersonCodeParam,
    bool noSequence = false,
  }) {
    final Map<String, dynamic> data = {
      "sequence": noSequence ? null : sequence,
      "integrationId": integrationIdParam ?? integrationId,
      "address": address,
      "typeCode": typeCode,
      "typeName": typeName,
      "legalPersonCode": legalPersonCodeParam,
    };
    data.removeWhere((key, value) => value == null);
    return data;
  }

  factory EnterpriseSocialNetworkModel.entitie(EnterpriseSocialNetwork e,
      {int? sequence}) {
    return EnterpriseSocialNetworkModel(
      sequence: sequence ?? e.sequence,
      integrationId: e.integrationId,
      address: e.address,
      typeCode: e.typeCode,
      typeName: e.typeName,
    );
  }
}
