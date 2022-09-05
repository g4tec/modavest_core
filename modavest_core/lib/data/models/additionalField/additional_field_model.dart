import 'package:modavest_core/data/models/additionalField/additional_field_hive.dart';
import 'package:modavest_core/domain/models/additional_field.dart';

class AdditionalFieldModel extends AdditionalField {
  const AdditionalFieldModel({
    required int id,
    int? code,
    String? name,
    String? type,
    String? value,
  }) : super(
          id: id,
          code: code,
          name: name,
          type: type,
          value: value,
        );

  factory AdditionalFieldModel.fromJson(Map json) {
    return AdditionalFieldModel(
      id: json["additionalId"] as int,
      code: json["additionalCode"] as int?,
      name: json["additionalName"] as String?,
      type: json["additionalType"] as String?,
      value: json["additionalValue"] as String?,
    );
  }

  factory AdditionalFieldModel.fromHive(HiveAdditionalField hive) {
    return AdditionalFieldModel(
      id: hive.id,
      code: hive.code,
      name: hive.name,
      type: hive.type,
      value: hive.value,
    );
  }
  HiveAdditionalField toHive() {
    return HiveAdditionalField(
      id: id,
      code: code,
      name: name,
      type: type,
      value: value,
    );
  }
}
