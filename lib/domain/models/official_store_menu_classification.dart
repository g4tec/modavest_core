import 'package:equatable/equatable.dart';

class OfficialStoreMenuClassification extends Equatable {
  final int menuId;
  final int officialStoreId;
  final int integrationId;
  final int? typeCode;
  final String? code;

  const OfficialStoreMenuClassification({
    required this.menuId,
    required this.officialStoreId,
    required this.integrationId,
    required this.typeCode,
    required this.code,
  });

  @override
  List<Object?> get props => [
        menuId,
        officialStoreId,
        integrationId,
        typeCode,
        code,
      ];
}
