import 'package:hive/hive.dart';

part 'product_manufacturer_hive.g.dart';

@HiveType(typeId: 7)
class HiveProductManufacturer extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int? code;
  @HiveField(2)
  final String? cpfCnpj;
  @HiveField(3)
  final String? name;

  HiveProductManufacturer({
    required this.id,
    this.code,
    this.cpfCnpj,
    this.name,
  });
}
