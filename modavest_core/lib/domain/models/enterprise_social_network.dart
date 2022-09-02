import 'package:equatable/equatable.dart';

class EnterpriseSocialNetwork extends Equatable {
  final int? sequence;
  final num? integrationId;
  final String? address;
  final num? typeCode;
  final String? typeName;

  const EnterpriseSocialNetwork({
    this.address,
    this.integrationId,
    this.typeName,
    this.typeCode,
    required this.sequence,
  });

  @override
  List<Object?> get props => [
        sequence,
        integrationId,
        address,
        typeCode,
        typeName,
      ];
}
