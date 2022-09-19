import 'package:modavest_core/domain/models/check.dart';

class CheckModel extends Check {
  CheckModel({
    required String checkBand,
    required DateTime checkReturnDate1,
    required int reasonForReturnCode1,
    required String reasonForReturnDescription1,
    required DateTime checkReturnDate2,
    required int reasonForReturnCode2,
    required String reasonForReturnDescription2,
    required DateTime checkReturnDate3,
    required int reasonForReturnCode3,
    required String reasonForReturnDescription3,
    required int bankNumber,
    required int agencyNumber,
    required int checkNumber,
    required String account,
    required String checkThirdName,
  }) : super(
          checkBand: checkBand,
          checkReturnDate1: checkReturnDate1,
          reasonForReturnCode1: reasonForReturnCode1,
          reasonForReturnDescription1: reasonForReturnDescription1,
          checkReturnDate2: checkReturnDate2,
          reasonForReturnCode2: reasonForReturnCode2,
          reasonForReturnDescription2: reasonForReturnDescription2,
          checkReturnDate3: checkReturnDate3,
          reasonForReturnCode3: reasonForReturnCode3,
          reasonForReturnDescription3: reasonForReturnDescription3,
          bankNumber: bankNumber,
          agencyNumber: agencyNumber,
          checkNumber: checkNumber,
          account: account,
          checkThirdName: checkThirdName,
        );

  factory CheckModel.fromJson(Map json) {
    return CheckModel(
      checkBand: json["checkBand"] as String,
      checkReturnDate1: DateTime.parse(json["checkReturnDate1"] as String),
      reasonForReturnCode1: json["reasonForReturnCode1"] as int,
      reasonForReturnDescription1:
          json["reasonForReturnDescription1"] as String,
      checkReturnDate2: DateTime.parse(json["checkReturnDate2"] as String),
      reasonForReturnCode2: json["reasonForReturnCode2"] as int,
      reasonForReturnDescription2:
          json["reasonForReturnDescription2"] as String,
      checkReturnDate3: DateTime.parse(json["checkReturnDate3"] as String),
      reasonForReturnCode3: json["reasonForReturnCode3"] as int,
      reasonForReturnDescription3:
          json["reasonForReturnDescription3"] as String,
      bankNumber: json["bankNumber"] as int,
      agencyNumber: json["agencyNumber"] as int,
      checkNumber: json["checkNumber"] as int,
      account: json["account"] as String,
      checkThirdName: json["checkThirdName"] as String,
    );
  }
}
