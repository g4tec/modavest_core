import 'package:modavest_core/domain/models/person.dart';

class Seller {
  final int sellerCode;
  final int integrationId;
  final String? name;
  final int? personCode;
  final String? personName;
  final String? maxChangeFilterDate;
  final String? photoUrl;
  final bool? canMakeToOrder;
  final bool? canDeliveryImmediately;
  final bool? canCheckFinance;
  final String? cpf;

  final Person? person;

  const Seller({
    required this.sellerCode,
    required this.integrationId,
    required this.name,
    required this.personCode,
    required this.personName,
    required this.photoUrl,
    required this.canMakeToOrder,
    required this.canDeliveryImmediately,
    required this.canCheckFinance,
    required this.cpf,
    required this.maxChangeFilterDate,
    this.person,
  });
}
