import 'package:modavest_core/assets/moda_vest_labels.dart';

String? validatePassword({String? value, String? compare}) {
  if (value!.length < 5) {
    return ModaVestLabels.shortPassword;
  }
  if (value != compare) {
    return ModaVestLabels.passwordsDoestMatch;
  }
  return null;
}
