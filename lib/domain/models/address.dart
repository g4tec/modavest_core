class Address {
  num addressType;
  num? sequence;
  num? integrationId;
  final String? publicPlace;
  final String address;
  final num? number;
  final String? complement;
  final String? neighborhood;
  final num? ibgeCityCode;
  final String cityName;
  final String? stateAbbreviation;
  final String cep;
  final num? bcbCountryCode;
  final String countryName;
  final num? postOfficeBox;
  final String? reference;
  final int branchInsertCode;

  Address({
    this.addressType = 1,
    this.integrationId,
    this.publicPlace,
    required this.address,
    this.number,
    this.complement,
    this.neighborhood,
    this.ibgeCityCode,
    required this.cityName,
    required this.stateAbbreviation,
    required this.cep,
    this.bcbCountryCode,
    this.countryName = "Brasil",
    this.postOfficeBox,
    this.reference,
    this.branchInsertCode = 1,
    this.sequence,
  });

  bool compareTo(Address address) {
    return addressType == address.addressType &&
        integrationId == address.integrationId &&
        publicPlace == address.publicPlace &&
        this.address == address.address &&
        number == address.number &&
        complement == address.complement &&
        neighborhood == address.neighborhood &&
        ibgeCityCode == address.ibgeCityCode &&
        cityName == address.cityName &&
        stateAbbreviation == address.stateAbbreviation &&
        cep == address.cep &&
        bcbCountryCode == address.bcbCountryCode &&
        countryName == address.countryName &&
        postOfficeBox == address.postOfficeBox &&
        reference == address.reference &&
        branchInsertCode == address.branchInsertCode &&
        sequence == address.sequence;
  }
}
