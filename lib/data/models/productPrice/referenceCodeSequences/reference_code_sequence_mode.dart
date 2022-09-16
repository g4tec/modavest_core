import 'package:modavest_core/data/models/productPrice/referenceCodeSequences/reference_code_sequence_hive.dart';
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
  factory ReferenceCodeSequenceModel.fromHive(HiveReferenceCodeSequence hive) {
    return ReferenceCodeSequenceModel(
      id: hive.id,
      code: hive.code,
      name: hive.name,
      referenceId: hive.referenceId,
      parentCode: hive.parentCode,
    );
  }
  HiveReferenceCodeSequence toHive() {
    return HiveReferenceCodeSequence(
      id: id,
      code: code,
      name: name,
      referenceId: referenceId,
      parentCode: parentCode,
    );
  }
}
