import 'package:validadores/Validador.dart';

String? validateCPF(String? value) {
  final String? error = Validador().add(Validar.CPF, msg: "CPF").validar(value);
  if (error != null) {
    return "CPF inválido";
  }
  return null;
}
