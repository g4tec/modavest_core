import 'package:modavest_core/data/models/classification/classification_model.dart';
import 'package:modavest_core/data/models/product/product_hive.dart';
import 'package:modavest_core/domain/models/additional_field.dart';
import 'package:modavest_core/domain/models/classification.dart';
import 'package:modavest_core/domain/models/product.dart';
import 'package:modavest_core/domain/models/product_manufacturer.dart';
import 'package:modavest_core/domain/models/reference_code_sequence.dart';
import 'package:modavest_core/domain/models/supplier.dart';

class ProductModel extends Product {
  const ProductModel({
    required String? referenceCode,
    required num code,
    required int? integrationId,
    required String colorCode,
    String? sku,
    String? name,
    String? ncm,
    String? cst,
    String? measuredUnit,
    String? size,
    bool? isActive,
    bool? isFinishedProduct,
    bool? isRawMaterial,
    bool? isBulkMaterial,
    bool? isOwnProduction,
    double? minimumStockAmount,
    double? maximumStockAmount,
    double? idealStockAmount,
    String? salesStartDate,
    String? salesEndDate,
    List<String>? barCodes,
    List<Classification>? classifications,
    List<AdditionalField>? additionalFields,
    List<Supplier>? suppliers,
    List<ProductManufacturer>? productManufacturers,
    List<ReferenceCodeSequence>? referenceCodeSequences,
    String? packAmount,
  }) : super(
          referenceCode: referenceCode,
          code: code,
          integrationId: integrationId,
          colorCode: colorCode,
          sku: sku,
          name: name,
          ncm: ncm,
          cst: cst,
          measuredUnit: measuredUnit,
          size: size,
          isActive: isActive,
          isFinishedProduct: isFinishedProduct,
          isRawMaterial: isRawMaterial,
          isBulkMaterial: isBulkMaterial,
          isOwnProduction: isOwnProduction,
          minimumStockAmount: minimumStockAmount,
          maximumStockAmount: maximumStockAmount,
          idealStockAmount: idealStockAmount,
          salesStartDate: salesStartDate,
          salesEndDate: salesEndDate,
          classifications: classifications,
          additionalFields: additionalFields,
          suppliers: suppliers,
          productManufacturers: productManufacturers,
          referenceCodeSequences: referenceCodeSequences,
          barCodes: barCodes,
          packAmount: packAmount,
        );

  factory ProductModel.fromJson(
    Map json, {
    required String referenceCode,
    required int integrationId,
    required String colorCode,
  }) {
    return ProductModel(
      referenceCode: referenceCode,
      code: json["code"] as num,
      integrationId: integrationId,
      colorCode: colorCode,
      sku: json["sku"] as String?,
      name: json["name"] as String?,
      ncm: json["ncm"] as String?,
      cst: json["cst"] as String?,
      measuredUnit: json["measuredUnit"] as String?,
      size: json["size"] as String?,
      isActive: json["isActive"] as bool?,
      isFinishedProduct: json["isFinishedProduct"] as bool?,
      isRawMaterial: json["isRawMaterial"] as bool?,
      isBulkMaterial: json["isBulkMaterial"] as bool?,
      isOwnProduction: json["isOwnProduction"] as bool?,
      minimumStockAmount: json["minimumStockAmount"]?.toDouble(),
      maximumStockAmount: json["maximumStockAmount"]?.toDouble(),
      idealStockAmount: json["codeealStockAmount"]?.toDouble(),
      salesStartDate: json["salesStartDate"] as String?,
      salesEndDate: json["salesEndDate"] as String?,
      barCodes:
          ((json["barCodes"] ?? []) as List).map((e) => e as String).toList(),
      packAmount: json["packAmount"] as String?,
      classifications: ((json["classifications"] ?? []) as List)
          .map(
            (e) => ClassificationModel.fromJson(
              e as Map<String, dynamic>,
              subCategoryId: "code:${(json["code"] as num).toString()}",
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "referenceCode": referenceCode,
      "code": code,
      "integrationId": integrationId,
      "colorCode": colorCode,
      "sku": sku,
      "name": name,
      "ncm": ncm,
      "cst": cst,
      "measuredUnit": measuredUnit,
      "size": size,
      "isActive": isActive,
      "isFinishedProduct": isFinishedProduct,
      "isRawMaterial": isRawMaterial,
      "isBulkMaterial": isBulkMaterial,
      "isOwnProduction": isOwnProduction,
      "minimumStockAmount": minimumStockAmount,
      "maximumStockAmount": maximumStockAmount,
      "idealStockAmount": idealStockAmount,
      "salesStartDate": salesStartDate,
      "salesEndDate": salesEndDate,
      "barCodes": barCodes,
      "classifications": classifications,
      "additionalFields": additionalFields,
      "suppliers": suppliers,
      "productManufacturers": productManufacturers,
      "referenceCodeSequences": referenceCodeSequences,
      "packAmount": packAmount,
    };
  }

  HiveProduct toHive() {
    return HiveProduct(
      referenceCode: referenceCode,
      code: code,
      integrationId: integrationId,
      colorCode: colorCode,
      sku: sku,
      name: name,
      ncm: ncm,
      cst: cst,
      measuredUnit: measuredUnit,
      size: size,
      isActive: isActive,
      isFinishedProduct: isFinishedProduct,
      isRawMaterial: isRawMaterial,
      isBulkMaterial: isBulkMaterial,
      isOwnProduction: isOwnProduction,
      minimumStockAmount: minimumStockAmount,
      maximumStockAmount: maximumStockAmount,
      idealStockAmount: idealStockAmount,
      salesStartDate: salesStartDate,
      salesEndDate: salesEndDate,
      barCodes: barCodes,

      packAmount: packAmount,
      // classifications: classifications,
      // additionalFields: additionalFields,
      // suppliers: suppliers,
      // productManufacturers: productManufacturers,
      // referenceCodeSequences: referenceCodeSequences,
    );
  }

  factory ProductModel.fromHive(HiveProduct hiveProduct) {
    return ProductModel(
      referenceCode: hiveProduct.referenceCode,
      code: hiveProduct.code,
      integrationId: hiveProduct.integrationId,
      colorCode: hiveProduct.colorCode,
      sku: hiveProduct.sku,
      name: hiveProduct.name,
      ncm: hiveProduct.ncm,
      cst: hiveProduct.cst,
      measuredUnit: hiveProduct.measuredUnit,
      size: hiveProduct.size,
      isActive: hiveProduct.isActive,
      isFinishedProduct: hiveProduct.isFinishedProduct,
      isRawMaterial: hiveProduct.isRawMaterial,
      isBulkMaterial: hiveProduct.isBulkMaterial,
      isOwnProduction: hiveProduct.isOwnProduction,
      minimumStockAmount: hiveProduct.minimumStockAmount,
      maximumStockAmount: hiveProduct.maximumStockAmount,
      idealStockAmount: hiveProduct.idealStockAmount,
      salesStartDate: hiveProduct.salesStartDate,
      salesEndDate: hiveProduct.salesEndDate,
      barCodes: hiveProduct.barCodes,
      packAmount: hiveProduct.packAmount,
      classifications: hiveProduct.classifications
          ?.map((e) => ClassificationModel.fromHive(e))
          .toList(),
      // imgList: hiveProduct.imgList,
    );
  }

  factory ProductModel.entity(Product product) {
    return ProductModel(
      referenceCode: product.referenceCode,
      code: product.code,
      integrationId: product.integrationId,
      colorCode: product.colorCode,
      sku: product.sku,
      name: product.name,
      ncm: product.ncm,
      cst: product.cst,
      measuredUnit: product.measuredUnit,
      size: product.size,
      isActive: product.isActive,
      isFinishedProduct: product.isFinishedProduct,
      isRawMaterial: product.isRawMaterial,
      isBulkMaterial: product.isBulkMaterial,
      isOwnProduction: product.isOwnProduction,
      minimumStockAmount: product.minimumStockAmount,
      maximumStockAmount: product.maximumStockAmount,
      idealStockAmount: product.idealStockAmount,
      salesStartDate: product.salesStartDate,
      salesEndDate: product.salesEndDate,
      barCodes: product.barCodes,
      packAmount: product.packAmount,

      // imgList: hiveProduct.imgList,
    );
  }
}
