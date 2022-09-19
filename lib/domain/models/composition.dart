import 'package:equatable/equatable.dart';

class Composition extends Equatable {
  final String referenceCode;
  final int integrationId;
  final String material;
  final double? percentage;

  const Composition({
    required this.referenceCode,
    required this.integrationId,
    required this.material,
    this.percentage,
  });

  @override
  List<Object?> get props => [
        referenceCode,
        integrationId,
        material,
        percentage,
      ];
}
