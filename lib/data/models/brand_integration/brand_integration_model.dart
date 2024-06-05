import 'package:modavest_core/data/models/brand/brand_model.dart';
import 'package:modavest_core/domain/models/brand_integration.dart';

class BrandIntegrationModel extends BrandIntegration {
  BrandIntegrationModel({
    required super.brandIntegrationId,
    required super.integrationIsReleased,
    required super.integrationId,
    required super.integrationIsManufacturer,
    super.brand,
  }) : super();

  factory BrandIntegrationModel.fromJson(
    Map<String, dynamic> json,
    num representativeCode,
  ) {
    return BrandIntegrationModel(
      brandIntegrationId: json['brandIntegrationId'] as int,
      integrationIsReleased: json['integrationIsReleased'] as bool,
      integrationId: json['integrationId'] as int,
      integrationIsManufacturer: json['integrationIsManufacturer'] as bool,
      brand:
          json['brand'] != null ? BrandModel.fromJson(json['brand'], 0) : null,
    );
  }
}
