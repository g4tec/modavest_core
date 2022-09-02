class LegalPersonPhone {
  final int typeCode;
  final String? number;
  final int? branchLine;
  final bool isDefault;
  final num? sequence;

  LegalPersonPhone({
    this.typeCode = 1,
    this.number,
    this.branchLine,
    this.isDefault = false,
    this.sequence,
  });
}
