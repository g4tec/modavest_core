import 'package:modavest_core/data/models/brand/brand_hive.dart';
import 'package:modavest_core/data/models/classification/classification_model.dart';
import 'package:modavest_core/domain/models/brand.dart';

class BrandModel extends Brand {
  BrandModel({
    int? brandId,
    String? brandName,
    String? brandPhotoUrl,
    String? brandCreatedAt,
    bool? brandIsActive,
    List<ClassificationModel>? classifications,
    required num representativeCode,
  }) : super(
          brandId: brandId,
          brandName: brandName,
          brandPhotoUrl: brandPhotoUrl,
          brandCreatedAt: brandCreatedAt,
          brandIsActive: brandIsActive,
          representativeCode: representativeCode,
          classifications: classifications,
        );

  factory BrandModel.fromJson(
    Map<String, dynamic> json,
    num representativeCode,
  ) {
    return BrandModel(
      brandId: json['brandId'] as int?,
      brandName: json['brandName'] as String?,
      brandPhotoUrl: json['brandPhotoUrl'] as String?,
      brandCreatedAt: json['brandCreatedAt'] as String?,
      brandIsActive: json['brandIsActive'] as bool,
      classifications: (json['classifications'] as List?)
          ?.map((e) => ClassificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      representativeCode: representativeCode,
    );
  }

  factory BrandModel.fromHive(HiveBrand hiveBrand) {
    return BrandModel(
      brandId: hiveBrand.brandId,
      brandName: hiveBrand.brandName,
      brandPhotoUrl: hiveBrand.brandPhotoUrl,
      brandCreatedAt: hiveBrand.brandCreatedAt,
      brandIsActive: hiveBrand.brandIsActive,
      representativeCode: hiveBrand.representativeCode,
      classifications: hiveBrand.classifications
          ?.map((e) => ClassificationModel.fromHive(e))
          .toList(),
    );
  }

  HiveBrand toHive() {
    return HiveBrand(
      brandId: brandId,
      brandName: brandName,
      brandPhotoUrl: brandPhotoUrl,
      brandCreatedAt: brandCreatedAt,
      brandIsActive: brandIsActive,
      representativeCode: representativeCode,
    );
  }
}
