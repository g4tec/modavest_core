import 'package:equatable/equatable.dart';

class Options extends Equatable {
  final String? observation;
  final num officialStoreId;
  final num questionId;
  final num sequence;
  final String option;
  final String? definedField;
  final String? definedFieldValue;
  final String? definedFieldType;
  final num? typeCode;
  final String? code;

  const Options({
    required this.observation,
    required this.officialStoreId,
    required this.questionId,
    required this.option,
    required this.typeCode,
    required this.code,
    required this.sequence,
    required this.definedField,
    required this.definedFieldValue,
    required this.definedFieldType,
  });

  @override
  List<Object?> get props => [
        observation,
        officialStoreId,
        questionId,
        sequence,
        option,
        typeCode,
        code,
        definedField,
        definedFieldValue,
        definedFieldType
      ];
}
