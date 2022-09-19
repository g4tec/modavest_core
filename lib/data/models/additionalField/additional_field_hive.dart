import 'package:hive/hive.dart';

part 'additional_field_hive.g.dart';

@HiveType(typeId: 0)
class HiveAdditionalField extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int? code;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? type;
  @HiveField(4)
  final String? value;

  HiveAdditionalField({
    required this.id,
    this.code,
    this.name,
    this.type,
    this.value,
  });
}
