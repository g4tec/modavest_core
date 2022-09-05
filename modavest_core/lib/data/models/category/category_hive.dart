import 'package:hive/hive.dart';
import 'package:modavest_core/data/models/classification/classification_hive.dart';

part 'category_hive.g.dart';

@HiveType(typeId: 1)
class HiveCategory extends HiveObject {
  @HiveField(0)
  final int? categoryId;
  @HiveField(1)
  final String? description;
  @HiveField(2)
  final String? categoryPhotoUrl;
  @HiveField(3)
  HiveList<HiveClassification>? classifications;
  @HiveField(4)
  HiveList<HiveCategory>? subCategories;
  @HiveField(5)
  final bool isSubcategory;
  @HiveField(6)
  final bool isStyle;
  HiveCategory({
    required this.categoryId,
    required this.description,
    required this.categoryPhotoUrl,
    this.classifications,
    this.subCategories,
    required this.isSubcategory,
    required this.isStyle,
  });
}
