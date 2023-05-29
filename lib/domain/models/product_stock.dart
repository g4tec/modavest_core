import 'package:equatable/equatable.dart';

class ProductStock extends Equatable {
  final num integrationId;
  final num officialStoreId;
  final num productCode;
  final num stock;

  const ProductStock({
    required this.integrationId,
    required this.officialStoreId,
    required this.productCode,
    required this.stock,
  });

  @override
  List<Object?> get props => [
        integrationId,
        officialStoreId,
        productCode,
        stock,
      ];
}
