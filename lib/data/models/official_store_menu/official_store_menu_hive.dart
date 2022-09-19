import 'package:hive/hive.dart';
import 'package:modavest_core/data/models/classification/classification_hive.dart';

part 'official_store_menu_hive.g.dart';

@HiveType(typeId: 24)
class HiveOfficialStoreMenu extends HiveObject {
  @HiveField(1)
  final int menuId;
  @HiveField(2)
  final int officialStoreId;
  @HiveField(3)
  final int integrationId;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  late HiveList<HiveClassification> classifications;
  @HiveField(6)
  late HiveList<HiveOfficialStoreMenu> subMenus;

  HiveOfficialStoreMenu({
    required this.menuId,
    required this.officialStoreId,
    required this.description,
    required this.integrationId,
  });
}
