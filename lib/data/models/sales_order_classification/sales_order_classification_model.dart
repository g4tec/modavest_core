import 'package:modavest_core/domain/models/sales_order_classification.dart';

class SalesOrderClassificationModel extends SalesOrderClassification {
  const SalesOrderClassificationModel({
    int? typeCode,
    String? typeName,
    String? code,
    String? name,
  }) : super(
          typeCode: typeCode,
          typeName: typeName,
          code: code,
          name: name,
        );
  factory SalesOrderClassificationModel.fromJson(Map json,
      {String? subCategoryId}) {
    return SalesOrderClassificationModel(
      typeCode: json["typeCode"] as int?,
      typeName: json["typeName"] as String?,
      code: json["code"] as String?,
      name: json["name"] as String?,
    );
  }

  factory SalesOrderClassificationModel.entitie(SalesOrderClassification e) {
    return SalesOrderClassificationModel(
      typeCode: e.typeCode,
      typeName: e.typeName,
      code: e.code,
      name: e.name,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "typeCode": typeCode,
      "typeName": typeName,
      "code": code,
      "name": name,
    };
  }
}
