import 'package:hive/hive.dart';
import 'package:modavest_core/data/models/classification/classification_hive.dart';

part 'brand_hive.g.dart';

@HiveType(typeId: 35)
class HiveBrand extends HiveObject {
  @HiveField(0)
  final int? brandId;
  @HiveField(1)
  final String? brandName;
  @HiveField(2)
  final String? brandPhotoUrl;
  @HiveField(3)
  final String? brandCreatedAt;
  @HiveField(4)
  final bool? brandIsActive;
  @HiveField(5)
  final num representativeCode;
  @HiveField(6)
  HiveList<HiveClassification>? classifications;

  HiveBrand({
    required this.representativeCode,
    this.brandId,
    this.brandName,
    this.brandPhotoUrl,
    this.brandCreatedAt,
    this.brandIsActive,
    this.classifications,
  });
}
