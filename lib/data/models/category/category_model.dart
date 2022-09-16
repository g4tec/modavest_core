import 'package:modavest_core/data/models/category/category_hive.dart';
import 'package:modavest_core/data/models/classification/classification_model.dart';
import 'package:modavest_core/domain/models/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required String? description,
    required String? categoryPhotoUrl,
    required int? categoryId,
    required int? masterCategoryId,
    required List<ClassificationModel> classifications,
    List<CategoryModel>? subCategories,
    bool isSubcategory = false,
    bool isStyle = false,
  }) : super(
          description: description,
          categoryPhotoUrl: categoryPhotoUrl,
          classifications: classifications,
          categoryId: categoryId,
          subCategories: subCategories,
          isSubcategory: isSubcategory,
          isStyle: isStyle,
          masterCategoryId: masterCategoryId,
        );

  factory CategoryModel.fromJson(
    Map<String, dynamic> json, {
    bool isSubcategorie = false,
    bool isStyle = false,
    int? masterCategoryId,
  }) {
    return CategoryModel(
      description: json["description"] as String?,
      categoryPhotoUrl: json["subCategoryPhotoUrl"] as String? ??
          json["categoryPhotoUrl"] as String?,
      categoryId: json["subCategoryId"] as int? ?? json["categoryId"] as int?,
      classifications: json["classifications"] != null
          ? (json["classifications"] as List)
              .map(
                (dynamic value) => ClassificationModel.fromJson(
                    value as Map<String, dynamic>,
                    subCategoryId:
                        "subCategoryId:${(json["subCategoryId"] as int? ?? json["categoryId"] as int?).toString()}"),
              )
              .toList()
          : [],
      subCategories: (json["subCategory"] as List?)
          ?.map(
            (e) => CategoryModel.fromJson(
              e as Map<String, dynamic>,
              isSubcategorie: true,
              masterCategoryId: json["categoryId"] as int?,
            ),
          )
          .toList(),
      isSubcategory: isSubcategorie,
      isStyle: isStyle,
      masterCategoryId: masterCategoryId,
    );
  }

  factory CategoryModel.fromHive(
    HiveCategory hive, {
    int? masterCategoryId,
  }) {
    return CategoryModel(
      description: hive.description,
      categoryPhotoUrl: hive.categoryPhotoUrl,
      categoryId: hive.categoryId,
      classifications: hive.classifications
              ?.map((e) => ClassificationModel.fromHive(e))
              .toList() ??
          [],
      subCategories: hive.subCategories
          ?.map((e) =>
              CategoryModel.fromHive(e, masterCategoryId: hive.categoryId))
          .toList(),
      isSubcategory: hive.isSubcategory,
      isStyle: hive.isStyle,
      masterCategoryId: masterCategoryId,
    );
  }

  Map<String, dynamic> toJson({bool isSubcategory = false}) {
    final data = {
      "description": description,
      "categoryPhotoUrl": categoryPhotoUrl,
      "classifications": classifications
          ?.map((e) => ClassificationModel.entitie(e).toJson())
          .toList(),
      "subCategory": subCategories
          ?.map(
            (e) => CategoryModel.entitie(e).toJson(),
          )
          .toList(),
      "isSubcategory": this.isSubcategory,
      "isStyle": isStyle,
      "masterCategoryId": masterCategoryId,
    };

    if (isSubcategory) {
      data.putIfAbsent("subCategoryId", () => categoryId);
      return data;
    }
    data.putIfAbsent("categoryId", () => categoryId);

    return data;
  }

  HiveCategory toHive() {
    return HiveCategory(
      description: description,
      categoryPhotoUrl: categoryPhotoUrl,
      categoryId: categoryId,
      isSubcategory: isSubcategory,
      isStyle: isStyle,
    );
  }

  factory CategoryModel.entitie(Category e) {
    return CategoryModel(
      description: e.description,
      categoryPhotoUrl: e.categoryPhotoUrl,
      classifications: (e.classifications ?? [])
          .map((e) => ClassificationModel.entitie(e))
          .toList(),
      categoryId: e.categoryId,
      subCategories:
          e.subCategories?.map((e) => CategoryModel.entitie(e)).toList(),
      isSubcategory: e.isSubcategory,
      isStyle: e.isStyle,
      masterCategoryId: e.masterCategoryId,
    );
  }
}
