import 'package:modavest_core/domain/models/sales_order_observation.dart';

class SalesOrderObservationModel extends SalesOrderObservation {
  const SalesOrderObservationModel({
    num? orderCode,
    num? branchCode,
    String? observation,
    String? visualizationType,
  }) : super(
          orderCode: orderCode,
          branchCode: branchCode,
          observation: observation,
          visualizationType: visualizationType,
        );
  factory SalesOrderObservationModel.fromJson(Map json,
      {String? subCategoryId}) {
    return SalesOrderObservationModel(
      orderCode: json["orderCode"] as num?,
      branchCode: json["branchCode"] as num?,
      observation: json["observation"] as String?,
      visualizationType: json["visualizationType"] as String?,
    );
  }

  factory SalesOrderObservationModel.entitie(SalesOrderObservation e) {
    return SalesOrderObservationModel(
      orderCode: e.orderCode,
      branchCode: e.branchCode,
      observation: e.observation,
      visualizationType: e.visualizationType,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "orderCode": orderCode,
      "branchCode": branchCode,
      "observation": observation,
      "visualizationType": visualizationType,
    };
  }
}
