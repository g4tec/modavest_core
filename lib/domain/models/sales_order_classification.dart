import 'package:equatable/equatable.dart';

class SalesOrderClassification extends Equatable {
  final int? typeCode;
  final String? code;
  final String? typeName;
  final String? name;

  const SalesOrderClassification({
    this.typeCode,
    this.code,
    this.typeName,
    this.name,
  });

  @override
  List<Object?> get props => [
        typeCode,
        typeName,
        code,
        name,
      ];
}
