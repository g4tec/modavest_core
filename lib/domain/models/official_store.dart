import 'package:equatable/equatable.dart';
import 'package:modavest_core/domain/models/discount.dart';
import 'package:modavest_core/domain/models/official_store_installment.dart';
import 'package:modavest_core/domain/models/payment_conditions.dart';
import 'package:modavest_core/domain/models/payment_types.dart';
import 'package:modavest_core/domain/models/price_table.dart';

class OficialStore extends Equatable {
  final num integrationId;
  final num officialStoreId;
  final String description;
  final bool isDeliveryImmediately;
  final bool isMakeToOrder;
  final bool isVisibleCustomer;
  final bool isVisibleRepresentative;
  final bool isVisibleSeller;
  final num? minimumCifValue;
  final String? logoUrl;
  final String? createdAt;
  final String? updatedAt;
  final List<PriceTable> priceTables;
  final List<Discount> discount;
  final List<PaymentConditions> paymentConditions;
  final OfficialStoreInstallment? installment;
  final List<PaymentTypes>? paymentTypes;

  const OficialStore({
    required this.integrationId,
    required this.officialStoreId,
    required this.description,
    required this.isDeliveryImmediately,
    required this.isMakeToOrder,
    required this.isVisibleCustomer,
    required this.isVisibleRepresentative,
    required this.isVisibleSeller,
    required this.minimumCifValue,
    required this.logoUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.priceTables,
    required this.discount,
    required this.paymentConditions,
    this.installment,
    this.paymentTypes,
    this.productStocks,
  });

  @override
  List<Object?> get props => [
        integrationId,
        officialStoreId,
        description,
        isDeliveryImmediately,
        isMakeToOrder,
        isVisibleCustomer,
        isVisibleRepresentative,
        isVisibleSeller,
        minimumCifValue,
        logoUrl,
        createdAt,
        updatedAt,
        priceTables,
      ];
}
