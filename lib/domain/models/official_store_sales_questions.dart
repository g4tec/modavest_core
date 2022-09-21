import 'package:modavest_core/domain/models/classification.dart';
import 'package:modavest_core/domain/models/options.dart';

class OfficialStoreSalesQuestions {
  final num integrationId;
  final num officialStoreId;
  final num questionId;
  final String description;
  final String questionType;
  final bool isDeliverImmediately;
  final bool isMakeToOrder;
  final List<Classification> classifications;
  final List<Options> options;
  final List<String> observations;
  final bool isRequired;
  final bool? isRepresentativeApp;
  final bool? isSellerApp;
  final bool? isShopkeeperApp;
  const OfficialStoreSalesQuestions({
    required this.integrationId,
    required this.officialStoreId,
    required this.questionId,
    required this.description,
    required this.questionType,
    required this.isDeliverImmediately,
    required this.isMakeToOrder,
    required this.classifications,
    required this.options,
    required this.observations,
    required this.isRequired,
    required this.isRepresentativeApp,
    required this.isSellerApp,
    required this.isShopkeeperApp,
  });
}
