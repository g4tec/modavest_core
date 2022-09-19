import 'package:hive/hive.dart';
import 'package:modavest_core/data/models/additionalField/additional_field_hive.dart';
import 'package:modavest_core/data/models/productManufacturer/product_manufacturer_hive.dart';
import 'package:modavest_core/data/models/productPrice/referenceCodeSequences/reference_code_sequence_hive.dart';
import 'package:modavest_core/data/models/supplier/supplier_hive.dart';
import 'package:modavest_core/data/models/classification/classification_hive.dart';

part 'product_hive.g.dart';

@HiveType(typeId: 6)
class HiveProduct extends HiveObject {
  @HiveField(0)
  final String? referenceCode;
  @HiveField(1)
  final num code;
  @HiveField(2)
  final int? integrationId;
  @HiveField(3)
  final String colorCode;
  @HiveField(4)
  final String? sku;
  @HiveField(5)
  final String? name;
  @HiveField(6)
  final String? nmc;
  @HiveField(7)
  final String? cst;
  @HiveField(8)
  final String? measuredUnit;
  @HiveField(9)
  final String? size;
  @HiveField(10)
  final bool? isActive;
  @HiveField(11)
  final bool? isFinishedProduct;
  @HiveField(12)
  final bool? isRawMaterial;
  @HiveField(13)
  final bool? isBulkMaterial;
  @HiveField(14)
  final bool? isOwnProduction;
  @HiveField(15)
  final double? minimumStockAmount;
  @HiveField(16)
  final double? maximumStockAmount;
  @HiveField(17)
  final double? idealStockAmount;
  @HiveField(18)
  final String? salesStartDate;
  @HiveField(19)
  final String? salesEndDate;
  @HiveField(20)
  final List<String>? barCodes;
  @HiveField(21)
  HiveList<HiveClassification>? classifications;
  @HiveField(22)
  HiveList<HiveAdditionalField>? additionalFields;
  @HiveField(23)
  HiveList<HiveSupplier>? suppliers;
  @HiveField(24)
  HiveList<HiveProductManufacturer>? productManufacturers;
  @HiveField(25)
  HiveList<HiveReferenceCodeSequence>? referenceCodeSequences;
  @HiveField(26)
  double? originalPrice;
  @HiveField(27)
  double? price;
  @HiveField(28)
  String? packAmount;
  HiveProduct({
    required this.referenceCode,
    required this.code,
    required this.integrationId,
    required this.colorCode,
    this.sku,
    this.name,
    this.nmc,
    this.cst,
    this.measuredUnit,
    this.size,
    this.isActive,
    this.isFinishedProduct,
    this.isRawMaterial,
    this.isBulkMaterial,
    this.isOwnProduction,
    this.minimumStockAmount,
    this.maximumStockAmount,
    this.idealStockAmount,
    this.salesStartDate,
    this.salesEndDate,
    this.barCodes,
    this.classifications,
    this.additionalFields,
    this.productManufacturers,
    this.referenceCodeSequences,
    this.suppliers,
    this.price,
    this.originalPrice,
    this.packAmount,
  });
}
