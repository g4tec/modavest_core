import 'package:equatable/equatable.dart';

class SalesOrderObservation extends Equatable {
  final num? orderCode;
  final num? branchCode;
  final String? visualizationType;
  final String? observation;

  const SalesOrderObservation({
    this.orderCode,
    this.branchCode,
    this.visualizationType,
    this.observation,
  });

  @override
  List<Object?> get props => [
        orderCode,
        visualizationType,
        branchCode,
        observation,
      ];
}
