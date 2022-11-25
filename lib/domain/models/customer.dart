import 'package:modavest_core/domain/models/address.dart';

class Customer {
  final int integrationId;
  final int? code;
  final String? name;
  final String? cpfCnpj;
  final String? fantasyName;
  final String? image;
  final List<Address> addresses;

  Customer({
    required this.integrationId,
    this.code,
    required this.name,
    required this.image,
    this.fantasyName,
    this.cpfCnpj,
    required this.addresses,
  });

  bool filter(String string) {
    return (name ?? "").toLowerCase().contains(string.toLowerCase()) ||
        (fantasyName ?? "").toLowerCase().contains(string.toLowerCase()) ||
        (cpfCnpj ?? "").toLowerCase().contains(string.toLowerCase());
  }
}
