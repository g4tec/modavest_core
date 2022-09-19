import 'package:validadores/Validador.dart';

String? validateCNPJorCPF(String? value) {
  final String? error = Validador()
      .add(Validar.CNPJ, msg: "CNPJ")
      .add(Validar.CPF, msg: "CPF")
      .validar(value);
  if (error != null && error.split(",").length > 1) {
    return "CNPJ ou CPF inválido";
  }
  return null;
}
