import 'package:modavest_core/assets/moda_vest_labels.dart';

String? defaultValidate(String? value, bool? isRequired) {
  if (value == null && isRequired == true) {
    return ModaVestLabels.fillThisField;
  }

  if ((value ?? '').isEmpty && isRequired == true) {
    return ModaVestLabels.fillThisField;
  }
  return null;
}
