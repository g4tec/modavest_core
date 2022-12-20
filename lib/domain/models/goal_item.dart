import 'package:modavest_core/domain/models/classification.dart';
import 'package:modavest_core/domain/models/legal_person.dart';
import 'package:modavest_core/domain/models/official_store.dart';

class GoalItem {
  final num goalCode;
  final num goalType;
  final DateTime initialDate;
  final DateTime finalDate;
  final List<OficialStore> officialStores;
  final List<String> colections;
  final List<String> ufs;
  final List<LegalPerson> legalPersons;
  final List<Classification> productClassifications;
  final List<Classification> orderClassifications;
  final List<String> references;
  final num? goalValue;
  final num? reachedValue;
  final num? goalQuantity;
  final num? reachedQuantity;

  GoalItem({
    required this.goalCode,
    required this.goalType,
    required this.initialDate,
    required this.finalDate,
    required this.officialStores,
    required this.colections,
    required this.ufs,
    required this.legalPersons,
    required this.productClassifications,
    required this.orderClassifications,
    required this.references,
    required this.goalValue,
    required this.reachedValue,
    required this.goalQuantity,
    required this.reachedQuantity,
  });
}
