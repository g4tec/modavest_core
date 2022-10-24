import 'package:equatable/equatable.dart';
import 'package:modavest_core/domain/models/average_period.dart';
import 'package:modavest_core/domain/models/payment_conditions.dart';
import 'package:modavest_core/domain/models/price_table_scales.dart';

class PriceTable extends Equatable {
  final int? officialStoreId;
  final int integrationId;
  final int priceTableCode;
  final String? stateCode;
  final String? state;
  final String? description;
  final List<AveragePeriod>? averagePeriod;
  final List<PaymentConditions>? paymentConditions;
  final List<PriceTableScales>? scales;

  const PriceTable({
    required this.officialStoreId,
    required this.integrationId,
    required this.priceTableCode,
    required this.stateCode,
    required this.state,
    required this.description,
    required this.averagePeriod,
    required this.paymentConditions,
    required this.scales,
  });

  @override
  List<Object?> get props => [
        officialStoreId,
        integrationId,
        priceTableCode,
        stateCode,
        state,
        description,
        scales,
      ];
}
