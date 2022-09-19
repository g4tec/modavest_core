import 'package:equatable/equatable.dart';

class AdditionalField extends Equatable {
  final int id;
  final int? code;
  final String? name;
  final String? type;
  final String? value;

  const AdditionalField({
    required this.id,
    this.code,
    this.name,
    this.type,
    this.value,
  });

  @override
  List<Object?> get props => [
        id,
        code,
        name,
        type,
        value,
      ];
}
