import 'package:modavest_core/data/models/classification/classification_hive.dart';
import 'package:modavest_core/domain/models/classification.dart';

class ClassificationModel extends Classification {
  const ClassificationModel({
    required int? id,
    int? typeCode,
    String? typeName,
    String? typeNameAux,
    String? code,
    String? name,
    String? nameAux,
    String? subcategoryId,
  }) : super(
          id: id,
          typeCode: typeCode,
          typeName: typeName,
          typeNameAux: typeNameAux,
          code: code,
          name: name,
          nameAux: nameAux,
          subcategoryId: subcategoryId,
        );
  factory ClassificationModel.fromJson(Map json, {String? subCategoryId}) {
    return ClassificationModel(
      id: json["id"] as int?,
      typeCode: json["typeCode"] as int?,
      typeName: json["typeName"] as String?,
      typeNameAux: json["typeNameAux"] as String?,
      code: json["code"] as String?,
      name: json["name"] as String?,
      nameAux: json["nameAux"] as String?,
      subcategoryId: json["subCategoryId"] is int
          ? json["subCategoryId"].toString()
          : json["subCategoryId"] as String? ?? subCategoryId,
    );
  }
  factory ClassificationModel.fromHive(HiveClassification hive) {
    return ClassificationModel(
      id: hive.id,
      typeCode: hive.typeCode,
      typeName: hive.typeName,
      typeNameAux: hive.typeNameAux,
      code: hive.code,
      name: hive.name,
      nameAux: hive.nameAux,
      subcategoryId: hive.subcategoryId,
    );
  }
  HiveClassification toHive() {
    return HiveClassification(
      id: id,
      typeCode: typeCode,
      typeName: typeName,
      typeNameAux: typeNameAux,
      code: code,
      name: name,
      nameAux: nameAux,
      subcategoryId: subcategoryId,
    );
  }

  factory ClassificationModel.entitie(Classification e) {
    return ClassificationModel(
      id: e.id,
      typeCode: e.typeCode,
      typeName: e.typeName,
      typeNameAux: e.typeNameAux,
      code: e.code,
      name: e.name,
      nameAux: e.nameAux,
      subcategoryId: e.subcategoryId,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "typeCode": typeCode,
      "typeName": typeName,
      "typeNameAux": typeNameAux,
      "code": code,
      "name": name,
      "nameAux": nameAux,
      "subCategoryId": subcategoryId,
    };
  }
}
