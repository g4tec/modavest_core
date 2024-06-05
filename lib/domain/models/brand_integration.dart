import 'package:modavest_core/domain/models/brand.dart';

class BrandIntegration {
  final int? brandIntegrationId;
  final bool? integrationIsReleased;
  final int? integrationId;
  final bool? integrationIsManufacturer;
  final Brand? brand;

  BrandIntegration({
    required this.brandIntegrationId,
    required this.integrationIsReleased,
    required this.integrationId,
    required this.integrationIsManufacturer,
    required this.brand,
  });
}
