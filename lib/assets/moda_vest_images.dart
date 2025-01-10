// ignore: avoid_classes_with_only_static_members
import 'package:flutter_flavor/flutter_flavor.dart';

class ModaVestImages {
  static String get _assetsPrefix {
    final flavor = FlavorConfig.instance.variables["flavor"];
    return "$flavor/";
  }

  static String get horizontalLogo =>
      "assets/images/${_assetsPrefix}BCO_HORIZ.png";
  static String get logoForPurpleBackground =>
      "assets/images/${_assetsPrefix}ROXO_HORIZ_02.png";
  static String get phoneShoppingcar =>
      "assets/images/${_assetsPrefix}carinho.png";
  static String get emptyBag => "assets/images/${_assetsPrefix}empty_bag.png";
  static String get imageNotSuported =>
      "assets/images/${_assetsPrefix}image_not_suported.png";
  static String get imageNotSuportedWhite =>
      "assets/images/${_assetsPrefix}image_not_suported_white.png";
}
