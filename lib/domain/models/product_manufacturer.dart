import 'package:equatable/equatable.dart';

class ProductManufacturer extends Equatable {
  final int id;
  final int? code;
  final String? cpfCnpj;
  final String? name;
  final String? image;

  const ProductManufacturer({
    required this.id,
    this.code,
    this.cpfCnpj,
    this.name,
    this.image,
  });

  @override
  List<Object?> get props => [
        id,
        code,
        cpfCnpj,
        name,
        image,
      ];
  bool filter(String string) {
    return name!.toLowerCase().contains(string.toLowerCase()) ||
        cpfCnpj!.toLowerCase().contains(string.toLowerCase());
  }
}
