import 'package:equatable/equatable.dart';
import 'package:modavest_core/domain/models/additional_field.dart';
import 'package:modavest_core/domain/models/classification.dart';
import 'package:modavest_core/domain/models/product_manufacturer.dart';
import 'package:modavest_core/domain/models/reference_code_sequence.dart';
import 'package:modavest_core/domain/models/supplier.dart';

class Product extends Equatable {
  final String? referenceCode;
  final int? integrationId;
  final num code;
  final String colorCode;
  final String? sku;
  final String? name;
  final String? nmc;
  final String? cst;
  final String? measuredUnit;
  final String? size;
  final bool? isActive;
  final bool? isFinishedProduct;
  final bool? isRawMaterial;
  final bool? isBulkMaterial;
  final bool? isOwnProduction;
  final double? minimumStockAmount;
  final double? maximumStockAmount;
  final double? idealStockAmount;
  final String? salesStartDate;
  final String? salesEndDate;
  final List<String>? barCodes;
  final List<Classification>? classifications;
  final List<AdditionalField>? additionalFields;
  final List<Supplier>? suppliers;
  final List<ProductManufacturer>? productManufacturers;
  final List<ReferenceCodeSequence>? referenceCodeSequences;

  final String? packAmount;
  const Product({
    required this.referenceCode,
    required this.integrationId,
    required this.code,
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
    this.suppliers,
    this.productManufacturers,
    this.referenceCodeSequences,
    this.packAmount,
  });

  @override
  List<Object?> get props => [
        referenceCode,
        integrationId,
        code,
        colorCode,
        sku,
        name,
        nmc,
        cst,
        measuredUnit,
        size,
        isActive,
        isFinishedProduct,
        isRawMaterial,
        isBulkMaterial,
        isOwnProduction,
        minimumStockAmount,
        maximumStockAmount,
        idealStockAmount,
        salesStartDate,
        salesEndDate,
        barCodes,
        classifications,
        additionalFields,
        suppliers,
        productManufacturers,
        referenceCodeSequences,
        packAmount,
      ];
}
