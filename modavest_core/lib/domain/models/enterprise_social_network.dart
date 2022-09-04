class EnterpriseSocialNetwork {
  int? sequence;
  final num? integrationId;
  final String? address;
  final num? typeCode;
  final String? typeName;

  EnterpriseSocialNetwork({
    this.address,
    this.integrationId,
    this.typeName,
    this.typeCode,
    required this.sequence,
  });
}
