import 'package:hive/hive.dart';
import 'package:modavest_core/data/models/image_color_reference/image_color_reference_hive.dart';
import 'package:modavest_core/data/models/product/product_hive.dart';

part 'color_hive.g.dart';

@HiveType(typeId: 3)
class HiveColor extends HiveObject {
  @HiveField(0)
  final int? integrationId;
  @HiveField(1)
  final String code;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? groupName;
  @HiveField(4)
  final String? auxiliaryCode;
  @HiveField(5)
  final String? auxiliaryName;
  @HiveField(6)
  final String? pantoneCode;
  @HiveField(7)
  HiveList<HiveProduct>? products;
  @HiveField(26)
  HiveList<HiveImageColorReference>? imgList;
  @HiveField(8)
  final String? referenceCode;
  HiveColor({
    required this.integrationId,
    required this.code,
    required this.referenceCode,
    this.name,
    this.groupName,
    this.auxiliaryCode,
    this.auxiliaryName,
    this.pantoneCode,
    this.products,
    required this.imgList,
  });
}
