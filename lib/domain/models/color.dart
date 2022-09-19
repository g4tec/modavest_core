import 'package:equatable/equatable.dart';
import 'package:modavest_core/domain/models/color_image_reference.dart';
import 'package:modavest_core/domain/models/product.dart';

class Color extends Equatable {
  final int? integrationId;
  final String? referenceCode;
  final String code;
  final String? name;
  final String? groupName;
  final String? auxiliaryCode;
  final String? auxiliaryName;
  final String? pantoneCode;
  final List<Product> products;
  final List<ImageColorReference> imgList;
  const Color({
    required this.products,
    required this.integrationId,
    required this.code,
    required this.referenceCode,
    this.name,
    this.groupName,
    this.auxiliaryCode,
    this.auxiliaryName,
    this.pantoneCode,
    this.imgList = const [],
  });
  @override
  List<Object?> get props => [
        integrationId,
        referenceCode,
        code,
        name,
        groupName,
        auxiliaryCode,
        auxiliaryName,
        pantoneCode,
      ];
}
