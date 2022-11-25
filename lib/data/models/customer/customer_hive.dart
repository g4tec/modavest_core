import 'package:hive/hive.dart';

part 'customer_hive.g.dart';

@HiveType(typeId: 11)
class HiveCustomer extends HiveObject {
  @HiveField(0)
  final int integrationId;
  @HiveField(1)
  final int? code;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? cpfCnpj;
  @HiveField(4)
  final String? fantasyName;
  @HiveField(5)
  final String? image;

  HiveCustomer({
    required this.integrationId,
    required this.code,
    this.name,
    this.cpfCnpj,
    this.fantasyName,
    this.image,
  });
}
