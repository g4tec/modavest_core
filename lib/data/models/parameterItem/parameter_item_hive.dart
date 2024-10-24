import 'package:hive/hive.dart';
import 'package:modavest_core/data/models/parameter/parameter_hive.dart';

part 'parameter_item_hive.g.dart';

@HiveType(typeId: 52)
class HiveParameterItem extends HiveObject {
  @HiveField(0)
  final num? integrationId;
  @HiveField(1)
  final String? value;
  @HiveField(2)
  final String? variant;
  @HiveField(3)
  final HiveParameter? parameter;

  HiveParameterItem({
    required this.integrationId,
    required this.value,
    required this.variant,
    required this.parameter,
  });
}
