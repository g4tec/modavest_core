import 'package:modavest_core/domain/models/reference_code_sequence.dart';

class ReferenceCodeSequenceModel extends ReferenceCodeSequence {
  const ReferenceCodeSequenceModel({
    required int id,
    String? code,
    String? name,
    int? referenceId,
    int? parentCode,
  }) : super(
          id: id,
          code: code,
          name: name,
          referenceId: referenceId,
          parentCode: parentCode,
        );
  factory ReferenceCodeSequenceModel.fromJson(Map json) {
    return ReferenceCodeSequenceModel(
      id: json["referenceCodeSequenceId"] as int,
      code: json["referenceCodeSequenceCode"] as String?,
      name: json["referenceCodeSequenceName"] as String?,
      referenceId: json["referenceCodeSequenceReferenceId"] as int?,
      parentCode: json["referenceCodeSequenceParentCode"] as int?,
    );
  }
}
