import 'package:equatable/equatable.dart';
import 'package:modavest_core/domain/models/scale.dart';

class PriceTableScales extends Equatable {
  final num scaleCode;
  final num integrationId;
  final num headerCode;
  final String? scaleDescription;
  final List<Scale> scales;
  final num priceTableCode;
  final String param;

  const PriceTableScales({
    required this.scaleCode,
    required this.integrationId,
    required this.headerCode,
    required this.scaleDescription,
    required this.scales,
    required this.priceTableCode,
    required this.param,
  });

  @override
  List<Object?> get props => [
        scaleCode,
        integrationId,
        headerCode,
        scaleDescription,
        scales,
        priceTableCode,
        param,
      ];
}
