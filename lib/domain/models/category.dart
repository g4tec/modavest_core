import 'package:equatable/equatable.dart';
import 'package:modavest_core/domain/models/classification.dart';

class Category extends Equatable {
  final int? categoryId;
  final int? masterCategoryId;
  final bool isSubcategory;
  final bool isStyle;
  final String? description;
  final String? categoryPhotoUrl;
  final List<Classification>? classifications;
  final List<Category>? subCategories;

  const Category({
    required this.categoryId,
    required this.classifications,
    required this.description,
    required this.categoryPhotoUrl,
    this.subCategories,
    this.isSubcategory = false,
    this.isStyle = false,
    this.masterCategoryId,
  });

  @override
  List<Object?> get props => [
        description,
        categoryPhotoUrl,
        classifications,
        categoryId,
        subCategories,
        isSubcategory,
        isStyle,
      ];
}
