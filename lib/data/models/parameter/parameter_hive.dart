import 'package:hive/hive.dart';

part 'parameter_hive.g.dart';

@HiveType(typeId: 51)
class HiveParameter extends HiveObject {
  @HiveField(0)
  final num? parameterId;
  @HiveField(1)
  final String? value;
  @HiveField(2)
  final String? code;

  HiveParameter({
    required this.parameterId,
    required this.value,
    required this.code,
  });
}
