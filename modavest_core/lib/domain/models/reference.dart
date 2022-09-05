import 'package:modavest_core/domain/models/color.dart';
import 'package:modavest_core/domain/models/composition.dart';
import 'package:modavest_core/domain/models/details.dart';
import 'package:modavest_core/domain/models/reference_price.dart';

class Reference {
  final String code;
  final int integrationId;
  final String? name;
  final String? description;
  final String? descriptive;
  final int? gridCode;
  final List<String>? grid;
  final String? weight;
  final String? height;
  final String? width;
  final String? length;
  final String? packWeight;
  final String? packHeight;
  final String? packWidth;
  final String? packLength;
  final List<String>? observations;
  final List<Detail>? details;
  final List<Composition>? composition;
  List<Color> colors;
  final String? imageColorReference;
  ReferencePrice? referencePrice;
  // final int priceTable;
  // final num oficialStore;
  final bool? isPack;
  final bool? isGrid;

  Reference({
    required this.code,
    required this.integrationId,
    required this.colors,
    // required this.oficialStore,
    // required this.priceTable,
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
    this.observations = const [],
    this.details = const [],
    this.composition = const [],
    this.imageColorReference,
    required this.referencePrice,
    this.isPack,
    this.isGrid,
  });

  bool filter(String string) {
    return (name ?? "").toLowerCase().contains(string.toLowerCase()) ||
        (description ?? "").toLowerCase().contains(string.toLowerCase()) ||
        code.toLowerCase().contains(string.toLowerCase());
  }
}
