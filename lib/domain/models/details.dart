import 'package:equatable/equatable.dart';

class Detail extends Equatable {
  final int integrationId;
  final String referenceCode;
  final int? typeCode;
  final String? type;
  final String? auxiliaryType;
  final String? title;
  final String? description;

  const Detail({
    required this.integrationId,
    required this.referenceCode,
    this.typeCode,
    this.type,
    this.auxiliaryType,
    this.title,
    this.description,
  });

  @override
  List<Object?> get props => [
        integrationId,
        referenceCode,
        typeCode,
        type,
        auxiliaryType,
        title,
        description,
      ];
}
