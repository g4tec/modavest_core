import 'package:modavest_core/data/models/image_color_reference/image_color_reference_hive.dart';
import 'package:modavest_core/domain/models/color_image_reference.dart';

class ImageColorReferenceModel extends ImageColorReference {
  const ImageColorReferenceModel({
    required String sequence,
    required String? image,
    required String? imageMedium,
    required String? imageSmall,
    String? referenceCode,
    String? colorCode,
    bool? isDefault,
    super.base64Image,
  }) : super(
          sequence: sequence,
          image: image,
          imageMedium: imageMedium,
          imageSmall: imageSmall,
          referenceCode: referenceCode,
          colorCode: colorCode,
          isDefault: isDefault,
        );

  factory ImageColorReferenceModel.fromJson(Map json) {
    return ImageColorReferenceModel(
      sequence: json["sequence"] as String,
      image: json["image"] as String?,
      imageMedium: json["image_medium"] as String?,
      imageSmall: json["image_small"] as String?,
      referenceCode: json["ReferenceCode"] as String?,
      colorCode: json["code"] as String?,
      isDefault: json["isDefault"] as bool?,
      base64Image: json["base64Image"],
    );
  }

  factory ImageColorReferenceModel.fromHive(HiveImageColorReference hive) {
    return ImageColorReferenceModel(
      sequence: hive.sequence,
      image: hive.image,
      imageMedium: hive.imageMedium,
      imageSmall: hive.imageSmall,
    );
  }

  factory ImageColorReferenceModel.entity(
    ImageColorReference imageColorReference,
  ) {
    return ImageColorReferenceModel(
      sequence: imageColorReference.sequence,
      image: imageColorReference.image,
      imageMedium: imageColorReference.imageMedium,
      imageSmall: imageColorReference.imageSmall,
    );
  }

  HiveImageColorReference toHive() {
    return HiveImageColorReference(
      sequence: sequence,
      image: image,
      imageMedium: imageMedium,
      imageSmall: imageSmall,
    );
  }
}
