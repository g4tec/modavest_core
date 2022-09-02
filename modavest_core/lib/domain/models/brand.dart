import 'package:modavest_core/domain/models/classification.dart';

class Brand {
  final num representativeCode;
  final int? brandId;
  final String? brandName;
  final String? brandPhotoUrl;
  final String? brandCreatedAt;
  final bool? brandIsActive;
  final List<Classification>? classifications;

  Brand({
    required this.representativeCode,
    this.brandId,
    this.brandName,
    this.brandPhotoUrl,
    this.brandCreatedAt,
    this.brandIsActive,
    this.classifications,
  });
}
