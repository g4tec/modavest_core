import 'package:hive/hive.dart';

part 'image_color_reference_hive.g.dart';

@HiveType(typeId: 39)
class HiveImageColorReference extends HiveObject {
  @HiveField(0)
  final String sequence;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? imageMedium;
  @HiveField(3)
  final String? imageSmall;
  @HiveField(4)
  final String? base64;
  HiveImageColorReference({
    required this.sequence,
    required this.image,
    required this.imageMedium,
    required this.imageSmall,
    required this.base64,
  });
}
