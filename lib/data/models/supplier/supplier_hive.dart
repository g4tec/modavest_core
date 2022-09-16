import 'package:hive/hive.dart';

part 'supplier_hive.g.dart';

@HiveType(typeId: 10)
class HiveSupplier extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int? code;
  @HiveField(2)
  final String? cpfCnpj;
  @HiveField(3)
  final String? name;

  HiveSupplier({
    required this.id,
    this.code,
    this.cpfCnpj,
    this.name,
  });
}
