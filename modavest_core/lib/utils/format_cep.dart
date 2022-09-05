String formatCep(String cep) {
  return "${cep.substring(0, 5)}-${cep.substring(5)}";
}
