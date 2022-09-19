import 'package:hive/hive.dart';
import 'package:modavest_core/data/models/average_period/average_period_hive.dart';
import 'package:modavest_core/data/models/payment_conditions/payment_conditions_hive.dart';

part 'price_table_hive.g.dart';

@HiveType(typeId: 16)
class HivePriceTable extends HiveObject {
  @HiveField(0)
  final int? officialStoreId;
  @HiveField(1)
  final int integrationId;
  @HiveField(2)
  final int priceTableCode;
  @HiveField(3)
  final String? stateCode;
  @HiveField(4)
  final String? state;
  @HiveField(5)
  final String? description;
  @HiveField(6)
  HiveList<HiveAveragePeriod>? averagePeriod;
  @HiveField(7)
  HiveList<HivePaymentConditions>? paymentConditions;

  HivePriceTable({
    required this.officialStoreId,
    required this.integrationId,
    required this.priceTableCode,
    required this.stateCode,
    required this.state,
    required this.description,
  });
}
