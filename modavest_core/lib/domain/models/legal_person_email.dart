class LegalPersonEmail {
  final String? email;
  final int typeCode;
  final num? sequence;
  final bool isDefault;

  LegalPersonEmail({
    this.email,
    this.typeCode = 1,
    this.sequence,
    this.isDefault = false,
  });
}
