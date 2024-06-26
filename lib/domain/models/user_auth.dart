import 'package:equatable/equatable.dart';
import 'package:modavest_core/domain/models/seller.dart';
import 'package:modavest_core/domain/models/store_employee.dart';

class UserAuth extends Equatable {
  final String name;
  final String email;
  final String? token;
  final String? refreshToken;
  final StoreEmployee? profile;
  final Seller? sellerProfile;

  const UserAuth({
    required this.email,
    required this.refreshToken,
    required this.name,
    this.profile,
    this.sellerProfile,
    this.token,
  });

  @override
  List<Object?> get props => [name, email, token, refreshToken];

  UserAuth copyWith({StoreEmployee? profile, Seller? sellerProfile}) {
    return UserAuth(
      email: email,
      refreshToken: refreshToken,
      name: name,
      profile: profile ?? this.profile,
      sellerProfile: sellerProfile ?? this.sellerProfile,
      token: token,
    );
  }
}
