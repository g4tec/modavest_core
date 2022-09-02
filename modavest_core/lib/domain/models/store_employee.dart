import 'package:equatable/equatable.dart';
import 'package:modavest_core/domain/models/legal_person.dart';

class StoreEmployee extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String function;
  final String legalPersonCnpj;
  final String cpf;
  final LegalPerson? legalPerson;
  final num? id;
  final bool isStoreAdmin;
  final bool isShowCaseAcess;
  final bool isShoppingCartAcess;
  final bool isCustomerOrderAcess;
  final bool isActive;
  final bool isUseTermsAcepted;
  final String? photoUrl;

  const StoreEmployee({
    required this.email,
    required this.name,
    required this.phone,
    required this.function,
    required this.legalPersonCnpj,
    required this.cpf,
    this.legalPerson,
    this.id,
    required this.isStoreAdmin,
    required this.isShowCaseAcess,
    required this.isShoppingCartAcess,
    required this.isCustomerOrderAcess,
    required this.isActive,
    required this.isUseTermsAcepted,
    this.photoUrl,
  });

  StoreEmployee copyWith(
      {String? name,
      String? email,
      String? phone,
      String? function,
      String? legalPersonCnpj,
      String? cpf,
      LegalPerson? legalPerson,
      num? id,
      bool? isStoreAdmin,
      bool? isShowCaseAcess,
      bool? isShoppingCartAcess,
      bool? isCustomerOrderAcess,
      bool? isActive,
      bool? isUseTermsAcepted,
      String? photoUrl}) {
    return StoreEmployee(
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      function: function ?? this.function,
      legalPersonCnpj: legalPersonCnpj ?? this.legalPersonCnpj,
      cpf: cpf ?? this.cpf,
      legalPerson: legalPerson ?? this.legalPerson,
      id: id ?? this.id,
      isStoreAdmin: isStoreAdmin ?? this.isStoreAdmin,
      isShowCaseAcess: isShowCaseAcess ?? this.isShowCaseAcess,
      isShoppingCartAcess: isShoppingCartAcess ?? this.isShoppingCartAcess,
      isCustomerOrderAcess: isCustomerOrderAcess ?? this.isCustomerOrderAcess,
      isActive: isActive ?? this.isActive,
      photoUrl: photoUrl ?? this.photoUrl,
      isUseTermsAcepted: isUseTermsAcepted ?? this.isUseTermsAcepted,
    );
  }

  @override
  List<Object?> get props => [
        name,
        email,
        phone,
        function,
        legalPersonCnpj,
        cpf,
        legalPerson,
        id,
        isStoreAdmin,
        isShowCaseAcess,
        isShoppingCartAcess,
        isCustomerOrderAcess,
        isActive,
      ];
}
