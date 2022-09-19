import 'package:equatable/equatable.dart';

class AveragePeriod extends Equatable {
  final num priceTableCode;
  final num integrationId;
  final num sequence;
  final num? quantity;
  final num? state;
  final num? variationPercentage;
  final num? variationValue;

  const AveragePeriod({
    required this.priceTableCode,
    required this.integrationId,
    required this.sequence,
    required this.quantity,
    required this.state,
    required this.variationPercentage,
    required this.variationValue,
  });

  @override
  List<Object?> get props => [
        priceTableCode,
        integrationId,
        sequence,
        quantity,
        state,
        variationPercentage,
      ];
}
