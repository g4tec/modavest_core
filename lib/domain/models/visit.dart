import 'package:equatable/equatable.dart';
import 'package:modavest_core/domain/models/address.dart';
import 'package:modavest_core/domain/models/position_coordinates.dart';

class Visit extends Equatable {
  final num customerCode;
  final num? integrationId;
  final String observation;
  final DateTime visitDate;
  final Address? address;
  final PositionCoordinates? positionCoordinates;
  final num brandId;
  final num representativeCode;

  const Visit({
    this.integrationId,
    required this.customerCode,
    required this.observation,
    required this.visitDate,
    required this.address,
    required this.positionCoordinates,
    required this.brandId,
    required this.representativeCode,
  });

  @override
  List<Object?> get props => [
        customerCode,
        observation,
        visitDate,
        address,
        positionCoordinates,
        brandId,
        representativeCode,
      ];
}
