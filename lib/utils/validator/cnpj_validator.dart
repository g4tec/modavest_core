import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:validadores/Validador.dart';

String? validateCNPJ(String? value) {
  final String? error =
      Validador().add(Validar.CNPJ, msg: "CNPJ").validar(value);
  if (error != null) {
    return ModaVestLabels.invalidCnpj;
  }
  return null;
}
