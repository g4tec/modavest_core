import 'package:modavest_core/assets/moda_vest_labels.dart';

String? validateCEP(String? cep) {
  final RegExp cepRegExp = RegExp(
    r'^[0-9]{5}-[\d]{3}',
  );
  if (cepRegExp.hasMatch(cep!)) {
    return null;
  }
  return ModaVestLabels.invalidCep;
}
