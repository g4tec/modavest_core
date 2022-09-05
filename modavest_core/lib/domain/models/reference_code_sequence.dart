import 'package:equatable/equatable.dart';

class ReferenceCodeSequence extends Equatable {
  final int id;
  final String? code;
  final String? name;
  final int? referenceId;
  final int? parentCode;

  const ReferenceCodeSequence({
    required this.id,
    this.code,
    this.name,
    this.referenceId,
    this.parentCode,
  });

  @override
  List<Object?> get props => [
        id,
        code,
        name,
        referenceId,
        parentCode,
      ];
}
