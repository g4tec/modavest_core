import 'package:modavest_core/data/models/details/details_hive.dart';
import 'package:modavest_core/domain/models/details.dart';

class DetailModel extends Detail {
  const DetailModel({
    required int integrationId,
    required String referenceCode,
    int? typeCode,
    String? auxiliaryType,
    String? title,
    String? type,
    String? description,
  }) : super(
          integrationId: integrationId,
          referenceCode: referenceCode,
          typeCode: typeCode,
          type: type,
          auxiliaryType: auxiliaryType,
          title: title,
          description: description,
        );
  factory DetailModel.fromJson(
    Map json, {
    required int integrationId,
    required String referenceCode,
  }) {
    return DetailModel(
      integrationId: integrationId,
      referenceCode: referenceCode,
      typeCode: json["typeCode"] as int?,
      type: json["type"] as String?,
      auxiliaryType: json["auxiliaryType"] as String?,
      title: json["title"] as String?,
      description: json["description"] as String?,
    );
  }
  factory DetailModel.fromHive(HiveDetail hive) {
    return DetailModel(
      integrationId: hive.integrationId,
      referenceCode: hive.referenceCode,
      typeCode: hive.typeCode,
      type: hive.type,
      auxiliaryType: hive.auxiliaryType,
      title: hive.title,
      description: hive.description,
    );
  }

  factory DetailModel.entity(Detail detail) {
    return DetailModel(
      integrationId: detail.integrationId,
      referenceCode: detail.referenceCode,
      typeCode: detail.typeCode,
      type: detail.type,
      auxiliaryType: detail.auxiliaryType,
      title: detail.title,
      description: detail.description,
    );
  }

  HiveDetail toHive() {
    return HiveDetail(
      referenceCode: referenceCode,
      integrationId: integrationId,
      typeCode: typeCode,
      type: type,
      auxiliaryType: auxiliaryType,
      title: title,
      description: description,
    );
  }
}
