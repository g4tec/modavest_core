import 'package:hive_flutter/hive_flutter.dart';
import 'package:modavest_core/data/models/classification/classification_hive.dart';
import 'package:modavest_core/data/models/options/options_hive.dart';

part 'official_store_sales_questions_hive.g.dart';

@HiveType(typeId: 30)
class HiveOfficialStoreSalesQuestions extends HiveObject {
  @HiveField(0)
  final num integrationId;
  @HiveField(1)
  final num officialStoreId;
  @HiveField(2)
  final num questionId;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String questionType;
  @HiveField(5)
  final bool isDeliverImmediately;
  @HiveField(6)
  final bool isMakeToOrder;
  @HiveField(7)
  HiveList<HiveClassification>? classifications;
  @HiveField(8)
  HiveList<HiveOptions>? options;
  @HiveField(9)
  final List<String>? observations;
  @HiveField(10)
  final bool isRequired;
  @HiveField(11)
  final bool? isRepresentativeApp;
  @HiveField(12)
  final bool? isSellerApp;
  @HiveField(13)
  final bool? isShopkeeperApp;
  HiveOfficialStoreSalesQuestions({
    required this.integrationId,
    required this.officialStoreId,
    required this.questionId,
    required this.description,
    required this.questionType,
    required this.isDeliverImmediately,
    required this.isMakeToOrder,
    this.classifications,
    this.options,
    this.observations,
    required this.isRequired,
    required this.isRepresentativeApp,
    required this.isSellerApp,
    required this.isShopkeeperApp,
  });
}
