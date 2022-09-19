import 'package:equatable/equatable.dart';

class Classification extends Equatable {
  final int? id;
  final int? typeCode;
  final String? typeName;
  final String? typeNameAux;
  final String? code;
  final String? name;
  final String? nameAux;
  final String? subcategoryId;

  const Classification({
    required this.id,
    this.typeCode,
    this.typeName,
    this.typeNameAux,
    this.code,
    this.name,
    this.nameAux,
    this.subcategoryId,
  });

  @override
  List<Object?> get props => [
        id,
        typeCode,
        typeName,
        typeNameAux,
        code,
        name,
        nameAux,
        subcategoryId,
      ];
}
