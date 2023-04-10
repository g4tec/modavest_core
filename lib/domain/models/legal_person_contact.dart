class LegalPersonContact {
  final num? legalPersonCode;
  final num? integrationId;
  final int sequence;
  final String name;
  final num? typeCode;
  final String? typeName;
  final String? function;
  final String? phoneNumber;
  final String? cellNumber;
  final String? email;
  final DateTime? birthDate;

  LegalPersonContact({
    this.legalPersonCode,
    this.integrationId,
    required this.sequence,
    required this.name,
    this.typeCode,
    this.typeName,
    this.function,
    this.phoneNumber,
    this.cellNumber,
    this.email,
    this.birthDate,
  });
}
