class EnterpriseReference {
  final int? sequence;
  final num? integrationId;
  final String? phoneNumber;
  final String? name;
  final String? typeReference;
  final String? description;

  EnterpriseReference({
    this.phoneNumber,
    this.integrationId,
    this.name,
    this.description,
    this.typeReference,
    required this.sequence,
  });
}
