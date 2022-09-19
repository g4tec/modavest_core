import 'package:hive/hive.dart';
import 'package:modavest_core/data/models/discount/discount_hive.dart';
import 'package:modavest_core/data/models/payment_conditions/payment_conditions_hive.dart';
import 'package:modavest_core/data/models/price_table/price_table_hive.dart';
part 'oficial_store_hive.g.dart';

@HiveType(typeId: 14)
class HiveOficialStore extends HiveObject {
  @HiveField(1)
  final num integrationId;
  @HiveField(2)
  final num officialStoreId;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final bool isDeliveryImmediately;
  @HiveField(5)
  final bool isMakeToOrder;
  @HiveField(6)
  final bool isVisibleCustomer;
  @HiveField(7)
  final bool isVisibleRepresentative;
  @HiveField(8)
  final bool isVisibleSeller;
  @HiveField(9)
  final num? minimumCifValue;
  @HiveField(10)
  final String? logoUrl;
  @HiveField(11)
  final String? createdAt;
  @HiveField(12)
  final String? updatedAt;
  @HiveField(13)
  late HiveList<HivePriceTable> priceTables;
  @HiveField(14)
  late HiveList<HiveDiscount> discount;
  @HiveField(15)
  late HiveList<HivePaymentConditions> paymentConditions;

  HiveOficialStore({
    required this.integrationId,
    required this.officialStoreId,
    required this.description,
    required this.isDeliveryImmediately,
    required this.isMakeToOrder,
    required this.isVisibleCustomer,
    required this.isVisibleRepresentative,
    required this.isVisibleSeller,
    required this.minimumCifValue,
    required this.logoUrl,
    required this.createdAt,
    required this.updatedAt,
  });
}
