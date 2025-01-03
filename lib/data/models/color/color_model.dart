import 'package:modavest_core/data/models/color/color_hive.dart';
import 'package:modavest_core/data/models/image_color_reference/image_color_reference_hive.dart';
import 'package:modavest_core/data/models/image_color_reference/image_color_reference_model.dart';
import 'package:modavest_core/data/models/product/product_hive.dart';
import 'package:modavest_core/data/models/product/product_model.dart';
import 'package:modavest_core/domain/models/color.dart';

class ColorModel extends Color {
  const ColorModel({
    required List<ProductModel> products,
    required List<ImageColorReferenceModel> imgList,
    required int? integrationId,
    required String? referenceCode,
    required String code,
    String? name,
    String? groupName,
    String? auxiliaryCode,
    String? auxiliaryName,
    String? pantoneCode,
  }) : super(
          integrationId: integrationId,
          referenceCode: referenceCode,
          products: products,
          imgList: imgList,
          code: code,
          name: name,
          groupName: groupName,
          auxiliaryCode: auxiliaryCode,
          auxiliaryName: auxiliaryName,
          pantoneCode: pantoneCode,
        );

  factory ColorModel.fromJson(
    Map json, {
    required String referenceCode,
    required int integrationId,
  }) {
    final List<ImageColorReferenceModel> imgList =
        ((json["imageColorReferences"] ?? []) as List)
            .map((e) => ImageColorReferenceModel.fromJson(e as Map))
            .toList();
    imgList.sort(
      (a, b) => a.sequence.compareTo(b.sequence),
    );
    return ColorModel(
      products: ((json["products"] ?? []) as List)
          .map(
            (e) => ProductModel.fromJson(
              e as Map,
              referenceCode: referenceCode,
              integrationId: integrationId,
              colorCode: json["code"] as String,
            ),
          )
          .toList(),
      integrationId: integrationId,
      code: json["code"] as String,
      referenceCode: referenceCode,
      name: json["name"] as String?,
      groupName: json["groupName"] as String?,
      auxiliaryCode: json["auxiliaryCode"] as String?,
      auxiliaryName: json["auxiliaryName"] as String?,
      pantoneCode: json["pantoneCode"] as String?,
      imgList: imgList,
    );
  }

  factory ColorModel.fromHive(HiveColor hive) {
    final List<ImageColorReferenceModel> imgList = (hive.imgList ?? [])
        .map(
          (e) => ImageColorReferenceModel.fromHive(
            e as HiveImageColorReference,
          ),
        )
        .toList();
    imgList.sort(
      (a, b) => a.sequence.compareTo(b.sequence),
    );
    return ColorModel(
      products: (hive.products ?? [])
          .map((e) => ProductModel.fromHive(e as HiveProduct))
          .toList(),
      imgList: imgList,
      code: hive.code,
      integrationId: hive.integrationId,
      referenceCode: hive.referenceCode,
      name: hive.name,
      groupName: hive.groupName,
      auxiliaryCode: hive.auxiliaryCode,
      auxiliaryName: hive.auxiliaryName,
      pantoneCode: hive.pantoneCode,
    );
  }

  factory ColorModel.entity(Color color) {
    final List<ImageColorReferenceModel> imgList = (color.imgList)
        .map(
          (e) => ImageColorReferenceModel.entity(
            e,
          ),
        )
        .toList();
    imgList.sort(
      (a, b) => a.sequence.compareTo(b.sequence),
    );

    final List<ProductModel> products = [];
    for (final product in color.products) {
      if (product.colorCode == color.code) {
        products.add(ProductModel.entity(product));
      }
    }

    return ColorModel(
      products: products,
      imgList: imgList,
      code: color.code,
      integrationId: color.integrationId,
      referenceCode: color.referenceCode,
      name: color.name,
      groupName: color.groupName,
      auxiliaryCode: color.auxiliaryCode,
      auxiliaryName: color.auxiliaryName,
      pantoneCode: color.pantoneCode,
    );
  }

  HiveColor toHive() {
    return HiveColor(
      referenceCode: referenceCode,
      integrationId: integrationId,
      code: code,
      name: name,
      groupName: groupName,
      auxiliaryCode: auxiliaryCode,
      auxiliaryName: auxiliaryName,
      pantoneCode: pantoneCode,
      imgList: null,
    );
  }
}
