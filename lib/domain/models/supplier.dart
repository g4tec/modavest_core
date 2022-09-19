import 'package:equatable/equatable.dart';

class Supplier extends Equatable {
  final int id;
  final int? code;
  final String? cpfCnpj;
  final String? name;

  const Supplier({
    required this.id,
    this.code,
    this.cpfCnpj,
    this.name,
  });

  @override
  List<Object?> get props => [
        id,
        code,
        cpfCnpj,
        name,
      ];
}
