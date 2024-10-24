import 'package:modavest_core/data/models/parameter/parameter_model.dart';
import 'package:modavest_core/data/models/parameterItem/parameter_item_hive.dart';
import 'package:modavest_core/domain/models/parameter_item.dart';

class ParameterItemModel extends ParameterItem {
  ParameterItemModel({
    super.integrationId,
    super.parameter,
    super.value,
    super.variant,
  });

  factory ParameterItemModel.fromJson(Map json) {
    return ParameterItemModel(
      integrationId: json["integrationId"] as num?,
      parameter: json["parameter"] is Map
          ? ParameterModel.fromJson(json["parameter"] as Map)
          : null,
      value: json["value"] as String?,
      variant: json["variant"] as String?,
    );
  }

  factory ParameterItemModel.fromEntity(ParameterItem parameterItem) {
    return ParameterItemModel(
      integrationId: parameterItem.integrationId,
      parameter: parameterItem.parameter,
      value: parameterItem.value,
      variant: parameterItem.variant,
    );
  }

  factory ParameterItemModel.fromHive(HiveParameterItem hiveParameterItem) {
    return ParameterItemModel(
      integrationId: hiveParameterItem.integrationId,
      parameter: hiveParameterItem.parameter != null
          ? ParameterModel.fromHive(hiveParameterItem.parameter!)
          : null,
      value: hiveParameterItem.value,
      variant: hiveParameterItem.variant,
    );
  }

  HiveParameterItem toHive() {
    return HiveParameterItem(
      integrationId: integrationId,
      parameter: parameter != null
          ? ParameterModel.fromEntity(parameter!).toHive()
          : null,
      value: value,
      variant: variant,
    );
  }
}
