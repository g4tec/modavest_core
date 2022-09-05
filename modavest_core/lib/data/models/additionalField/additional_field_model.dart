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
}
