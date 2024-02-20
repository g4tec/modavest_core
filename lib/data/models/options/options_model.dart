import 'package:modavest_core/data/models/options/options_hive.dart';
import 'package:modavest_core/domain/models/options.dart';

class OptionsModel extends Options {
  const OptionsModel({
    required super.observation,
    required super.officialStoreId,
    required super.questionId,
    required super.sequence,
    required super.typeCode,
    required super.code,
    required super.option,
    required super.definedField,
    required super.definedFieldValue,
    required super.definedFieldType,
  });

  factory OptionsModel.fromJson(Map json) {
    return OptionsModel(
      observation: json['observation'] as String?,
      officialStoreId: json['officialStoreId'] as num,
      questionId: json['questionId'] as num,
      sequence: json['sequence'] as num,
      option: json['option'] as String? ?? "",
      typeCode: json['typeCode'] as num?,
      code: json['code'] as String?,
      definedField: json['definedField'] as String?,
      definedFieldValue: json['definedFieldValue'] as String?,
      definedFieldType: json['definedFieldType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['observation'] = observation;
    data['officialStoreId'] = officialStoreId;
    data['questionId'] = questionId;
    data['sequence'] = sequence;
    data['definedField'] = definedField;
    data['option'] = option;
    data['definedFieldValue'] = definedFieldValue;
    data['definedFieldType'] = definedFieldType;
    return data;
  }

  factory OptionsModel.fromHive(HiveOptions hiveOptions) {
    return OptionsModel(
      observation: hiveOptions.observation,
      officialStoreId: hiveOptions.officialStoreId,
      questionId: hiveOptions.questionId,
      sequence: hiveOptions.sequence,
      option: hiveOptions.option,
      typeCode: hiveOptions.typeCode,
      code: hiveOptions.code,
      definedField: hiveOptions.definedField,
      definedFieldValue: hiveOptions.definedFieldValue,
      definedFieldType: hiveOptions.definedFieldType,
    );
  }

  factory OptionsModel.entity(Options option) {
    return OptionsModel(
      observation: option.observation,
      officialStoreId: option.officialStoreId,
      questionId: option.questionId,
      sequence: option.sequence,
      option: option.option,
      typeCode: option.typeCode,
      code: option.code,
      definedField: option.definedField,
      definedFieldValue: option.definedFieldValue,
      definedFieldType: option.definedFieldType,
    );
  }

  HiveOptions toHive() {
    return HiveOptions(
      observation: observation,
      officialStoreId: officialStoreId,
      questionId: questionId,
      sequence: sequence,
      option: option,
      typeCode: typeCode,
      code: code,
      definedField: definedField,
      definedFieldValue: definedFieldValue,
      definedFieldType: definedFieldType,
    );
  }
}
