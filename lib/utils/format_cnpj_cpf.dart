import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:validadores/Validador.dart';

String formatCnpjCpf(String value) {
  final String? error = Validador()
      .add(Validar.CNPJ, msg: "CNPJ")
      .add(Validar.CPF, msg: "CPF")
      .validar(value);
  if (error != null && error.split(",").length < 2) {
    if (error.contains("CNPJ")) {
      return CPFValidator.format(value);
    }
    return CNPJValidator.format(value);
  }
  return value;
}
