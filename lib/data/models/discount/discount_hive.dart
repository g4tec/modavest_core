import 'package:hive_flutter/hive_flutter.dart';

part 'discount_hive.g.dart';

@HiveType(typeId: 28)
class HiveDiscount extends HiveObject {
  @HiveField(0)
  final num code;
  @HiveField(1)
  final num percentage;

  HiveDiscount({required this.code, required this.percentage});
}
