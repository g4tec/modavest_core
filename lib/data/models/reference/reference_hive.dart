import 'package:hive/hive.dart';
import 'package:modavest_core/data/models/color/color_hive.dart';
import 'package:modavest_core/data/models/composition/composition_hive.dart';
import 'package:modavest_core/data/models/details/details_hive.dart';
import 'package:modavest_core/data/models/referencePrice/reference_price_hive.dart';

part 'reference_hive.g.dart';

@HiveType(typeId: 8)
class HiveReference extends HiveObject {
  @HiveField(0)
  final String code;
  @HiveField(1)
  final int integrationId;
  @HiveField(6)
  final String? name;
  @HiveField(7)
  final String? description;
  @HiveField(8)
  final String? descriptive;
  @HiveField(9)
  final int? gridCode;
  @HiveField(10)
  final List<String>? grid;
  @HiveField(11)
  final String? weight;
  @HiveField(12)
  final String? height;
  @HiveField(13)
  final String? width;
  @HiveField(14)
  final String? length;
  @HiveField(15)
  final String? packWeight;
  @HiveField(16)
  final String? packHeight;
  @HiveField(17)
  final String? packWidth;
  @HiveField(18)
  final String? packLength;
  @HiveField(19)
  final List<String>? observations;
  @HiveField(20)
  HiveList<HiveColor>? colors;
  @HiveField(21)
  HiveList<HiveDetail>? details;
  @HiveField(22)
  HiveList<HiveComposition>? composition;

  @HiveField(23)
  final String? imageColorReference;
  @HiveField(24)
  HiveReferencePrice? referencePrice;
  @HiveField(25)
  final num? oficialStore;
  @HiveField(26)
  num? priceTable;
  @HiveField(27)
  final bool? isPack;
  @HiveField(28)
  final bool? isGrid;
  HiveReference({
    required this.oficialStore,
    required this.priceTable,
    required this.code,
    required this.integrationId,
    this.colors,
    this.name,
    this.description,
    this.descriptive,
    this.gridCode,
    this.grid,
    this.weight,
    this.height,
    this.width,
    this.length,
    this.packWeight,
    this.packHeight,
    this.packWidth,
    this.packLength,
    this.observations,
    this.details,
    this.composition,
    this.imageColorReference,
    this.referencePrice,
    this.isPack,
    this.isGrid,
  });
}
