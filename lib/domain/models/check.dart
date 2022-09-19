class Check {
  final String checkBand;
  final DateTime checkReturnDate1;
  final int reasonForReturnCode1;
  final String reasonForReturnDescription1;
  final DateTime checkReturnDate2;
  final int reasonForReturnCode2;
  final String reasonForReturnDescription2;
  final DateTime checkReturnDate3;
  final int reasonForReturnCode3;
  final String reasonForReturnDescription3;
  final int bankNumber;
  final int agencyNumber;
  final int checkNumber;
  final String account;
  final String checkThirdName;

  Check({
    required this.checkBand,
    required this.checkReturnDate1,
    required this.reasonForReturnCode1,
    required this.reasonForReturnDescription1,
    required this.checkReturnDate2,
    required this.reasonForReturnCode2,
    required this.reasonForReturnDescription2,
    required this.checkReturnDate3,
    required this.reasonForReturnCode3,
    required this.reasonForReturnDescription3,
    required this.bankNumber,
    required this.agencyNumber,
    required this.checkNumber,
    required this.account,
    required this.checkThirdName,
  });
}
