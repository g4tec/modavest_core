import 'package:modavest_core/domain/models/composition.dart';

class CompositionModel extends Composition {
  const CompositionModel({
    required int integrationId,
    required String material,
    required String referenceCode,
    double? percentage,
  }) : super(
          integrationId: integrationId,
          material: material,
          referenceCode: referenceCode,
          percentage: percentage,
        );

  factory CompositionModel.fromJson(
    Map json, {
    required String referenceCode,
    required int integrationId,
  }) {
    return CompositionModel(
      integrationId: integrationId,
      referenceCode: referenceCode,
      material: json["material"] as String,
      percentage: (json["percentage"] as num?)?.toDouble(),
    );
  }

  factory CompositionModel.entity(Composition composition) {
    return CompositionModel(
      referenceCode: composition.referenceCode,
      integrationId: composition.integrationId,
      material: composition.material,
      percentage: composition.percentage,
    );
  }
}
