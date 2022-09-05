import 'package:modavest_core/data/models/color/color_hive.dart';
import 'package:modavest_core/data/models/color/color_model.dart';
import 'package:modavest_core/data/models/composition/composition_model.dart';
import 'package:modavest_core/data/models/details/details_model.dart';
import 'package:modavest_core/data/models/reference/reference_hive.dart';
import 'package:modavest_core/data/models/referencePrice/reference_price_model.dart';
import 'package:modavest_core/domain/models/composition.dart';
import 'package:modavest_core/domain/models/details.dart';
import 'package:modavest_core/domain/models/reference.dart';

class ReferenceModel extends Reference {
  ReferenceModel({
    required String code,
    required int integrationId,
    required List<ColorModel> colors,
    String? name,
    String? description,
    String? descriptive,
    int? gridCode,
    List<String>? grid,
    String? weight,
    String? height,
    String? width,
    String? length,
    String? packWeight,
    String? packHeight,
    String? packWidth,
    String? packLength,
    List<String>? observations = const [],
    List<Detail>? details = const [],
    List<Composition>? composition = const [],
    String? imageColorReference,
    ReferencePriceModel? referencePrice,
    int? priceTable,
    num? oficialStore,
    bool? isPack,
    bool? isGrid,
  }) : super(
          code: code,
          integrationId: integrationId,
          colors: colors,
          name: name,
          oficialStore: oficialStore,
          priceTable: priceTable,
          description: description,
          descriptive: descriptive,
          grid: grid,
          gridCode: gridCode,
          weight: weight,
          height: height,
          width: width,
          length: length,
          packWeight: packWeight,
          packHeight: packHeight,
          packWidth: packWidth,
          packLength: packLength,
          observations: observations,
          details: details,
          composition: composition,
          imageColorReference: imageColorReference,
          referencePrice: referencePrice,
          isPack: isPack,
          isGrid: isGrid,
        );

  factory ReferenceModel.fromJson(
    Map json, {
    int? priceTable,
    num? oficialStore,
  }) {
    return ReferenceModel(
      code: json["ReferenceCode"] as String,
      priceTable: priceTable ?? json["priceTable"] as int,
      oficialStore: oficialStore ?? json["oficialStore"] as num,
      integrationId: json["integrationId"] as int,
      colors: ((json["colors"] ?? []) as List)
          .map(
            (e) => ColorModel.fromJson(
              e as Map,
              integrationId: json["integrationId"] as int,
              referenceCode: json["ReferenceCode"] as String,
            ),
          )
          .toList(),
      name: json["name"] as String?,
      description: json["description"] as String?,
      descriptive: json["descriptive"] as String?,
      gridCode: json["gridCode"] as int?,
      grid: ((json["grid"] ?? []) as List).map((e) => e.toString()).toList(),
      weight: json["weight"] as String?,
      height: json["height"] as String?,
      width: json["width"] as String?,
      length: json["length"] as String?,
      packWeight: json["packWeight"] as String?,
      packHeight: json["packHeight"] as String?,
      packWidth: json["packWidth"] as String?,
      packLength: json["packLength"] as String?,
      observations: (json["referenceObservations"] as List?)
          ?.map((e) => (e as Map)["observation"] as String)
          .toList(),
      details: (json["details"] as List?)
          ?.map(
            (e) => DetailModel.fromJson(
              e as Map,
              integrationId: json["integrationId"] as int,
              referenceCode: json["ReferenceCode"] as String,
            ),
          )
          .toList(),
      composition: (json["composition"] as List?)
          ?.map(
            (e) => CompositionModel.fromJson(
              e as Map,
              integrationId: json["integrationId"] as int,
              referenceCode: json["ReferenceCode"] as String,
            ),
          )
          .toList(),
      imageColorReference: json["defaultImage"] as String?,
      isPack: json["isPack"] as bool?,
      isGrid: json["isGrid"] as bool?,
    );
  }

  factory ReferenceModel.fromHive(
    HiveReference reference,
  ) {
    return ReferenceModel(
      code: reference.code,
      priceTable: reference.priceTable,
      oficialStore: reference.oficialStore,
      integrationId: reference.integrationId,
      colors: (reference.colors ?? [])
          .map((e) => ColorModel.fromHive(e as HiveColor))
          .toList(),
      name: reference.name,
      description: reference.description,
      descriptive: reference.descriptive,
      gridCode: reference.gridCode,
      grid: reference.grid,
      weight: reference.weight,
      height: reference.height,
      width: reference.width,
      length: reference.length,
      packWeight: reference.packWeight,
      packHeight: reference.packHeight,
      packWidth: reference.packWidth,
      packLength: reference.packLength,
      observations: reference.observations,
      details: reference.details?.map((e) => DetailModel.fromHive(e)).toList(),
      composition: reference.composition
          ?.map((e) => CompositionModel.fromHive(e))
          .toList(),
      imageColorReference: reference.imageColorReference,
      isPack: reference.isPack,
      isGrid: reference.isGrid,
    );
  }

  factory ReferenceModel.entity(
    Reference reference,
  ) {
    return ReferenceModel(
      code: reference.code,
      priceTable: reference.priceTable,
      oficialStore: reference.oficialStore,
      integrationId: reference.integrationId,
      colors: (reference.colors).map((e) => ColorModel.entity(e)).toList(),
      name: reference.name,
      description: reference.description,
      descriptive: reference.descriptive,
      gridCode: reference.gridCode,
      grid: reference.grid,
      weight: reference.weight,
      height: reference.height,
      width: reference.width,
      length: reference.length,
      packWeight: reference.packWeight,
      packHeight: reference.packHeight,
      packWidth: reference.packWidth,
      packLength: reference.packLength,
      observations: reference.observations,
      details: reference.details?.map((e) => DetailModel.entity(e)).toList(),
      composition: reference.composition
          ?.map((e) => CompositionModel.entity(e))
          .toList(),
      imageColorReference: reference.imageColorReference,
      isPack: reference.isPack,
      isGrid: reference.isGrid,
    );
  }

  HiveReference toHive() {
    return HiveReference(
      code: code,
      priceTable: priceTable,
      oficialStore: oficialStore,
      integrationId: integrationId,
      name: name,
      description: description,
      descriptive: descriptive,
      gridCode: gridCode,
      grid: grid,
      weight: weight,
      height: height,
      width: width,
      length: length,
      packWeight: packWeight,
      packHeight: packHeight,
      packWidth: packWidth,
      packLength: packLength,
      imageColorReference: imageColorReference,
      observations: observations,
      // TODO: Implementar
      // referencePrice: referencePrice,
      isPack: isPack,
      isGrid: isGrid,
    );
  }
}
