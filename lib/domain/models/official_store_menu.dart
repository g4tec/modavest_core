import 'package:equatable/equatable.dart';
import 'package:modavest_core/domain/models/classification.dart';

class OfficialStoreMenu extends Equatable {
  final int menuId;
  final int officialStoreId;
  final int integrationId;
  final String? description;
  final List<Classification> classifications;
  final List<OfficialStoreMenu> subMenus;

  const OfficialStoreMenu({
    required this.menuId,
    required this.officialStoreId,
    required this.integrationId,
    required this.description,
    required this.classifications,
    required this.subMenus,
  });

  @override
  List<Object?> get props => [
        menuId,
        officialStoreId,
        integrationId,
        description,
        classifications,
        subMenus,
      ];
}
