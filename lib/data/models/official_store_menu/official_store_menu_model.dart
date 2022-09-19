import 'package:modavest_core/data/models/classification/classification_model.dart';
import 'package:modavest_core/data/models/official_store_menu/official_store_menu_hive.dart';
import 'package:modavest_core/domain/models/classification.dart';
import 'package:modavest_core/domain/models/official_store_menu.dart';

class OfficialStoreMenuModel extends OfficialStoreMenu {
  const OfficialStoreMenuModel({
    required int menuId,
    required int officialStoreId,
    required int integrationId,
    required String? description,
    required List<Classification> classifications,
    required List<OfficialStoreMenuModel> subMenus,
  }) : super(
          menuId: menuId,
          officialStoreId: officialStoreId,
          integrationId: integrationId,
          description: description,
          classifications: classifications,
          subMenus: subMenus,
        );

  factory OfficialStoreMenuModel.fromJson(Map json) {
    return OfficialStoreMenuModel(
      menuId: json['menuId'] as int,
      officialStoreId: json['officialStoreId'] as int,
      integrationId: json['integrationId'] as int,
      description: json['description'] as String?,
      classifications: ((json['classifications'] ?? []) as List)
          .map(
            (dynamic e) => ClassificationModel.fromJson(
              e as Map,
              subCategoryId:
                  "officialStoreId:${json['officialStoreId'].toString()}",
            ),
          )
          .toList(),
      subMenus: ((json['subMenus'] as List?) ?? [])
          .map((dynamic e) => OfficialStoreMenuModel.fromJson(e as Map))
          .toList(),
    );
  }
  HiveOfficialStoreMenu toHive() {
    return HiveOfficialStoreMenu(
      menuId: menuId,
      officialStoreId: officialStoreId,
      integrationId: integrationId,
      description: description,
    );
  }

  factory OfficialStoreMenuModel.fromHive(
    HiveOfficialStoreMenu hiveOfficialStoreMenu,
  ) {
    return OfficialStoreMenuModel(
      menuId: hiveOfficialStoreMenu.menuId,
      officialStoreId: hiveOfficialStoreMenu.officialStoreId,
      integrationId: hiveOfficialStoreMenu.integrationId,
      description: hiveOfficialStoreMenu.description,
      classifications: hiveOfficialStoreMenu.classifications
          .map((e) => ClassificationModel.fromHive(e))
          .toList(),
      subMenus: hiveOfficialStoreMenu.subMenus
          .map((e) => OfficialStoreMenuModel.fromHive(e))
          .toList(),
    );
  }
}
