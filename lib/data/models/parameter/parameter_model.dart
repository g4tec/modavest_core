import 'package:modavest_core/data/models/parameter/parameter_hive.dart';
import 'package:modavest_core/domain/models/parameter_simple.dart';

class ParameterModel extends Parameter {
  ParameterModel({
    super.parameterId,
    super.value,
    super.code,
  });

  factory ParameterModel.fromJson(Map json) {
    return ParameterModel(
      parameterId: json["integrationId"] as num?,
      value: json["value"] as String?,
      code: json["code"] as String?,
    );
  }
  factory ParameterModel.fromHive(HiveParameter hiveParameterModel) {
    return ParameterModel(
      parameterId: hiveParameterModel.parameterId,
      value: hiveParameterModel.value,
      code: hiveParameterModel.code,
    );
  }

  factory ParameterModel.fromEntity(Parameter parameter) {
    return ParameterModel(
      parameterId: parameter.parameterId,
      value: parameter.value,
      code: parameter.code,
    );
  }

  HiveParameter toHive() {
    return HiveParameter(
      parameterId: parameterId,
      value: value,
      code: code,
    );
  }
}
