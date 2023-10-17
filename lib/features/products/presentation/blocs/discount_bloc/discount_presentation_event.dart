part of 'discount_presentation_bloc.dart';

abstract class DiscountPresentationEvent extends Equatable {
  const DiscountPresentationEvent();

  @override
  List<Object> get props => [];
}

class GetPricesEvent extends DiscountPresentationEvent {
  final List<ProductPrice?> prices;
  final num oficialStoreId;
  final num priceTableCode;

  const GetPricesEvent({
    required this.prices,
    required this.oficialStoreId,
    required this.priceTableCode,
  });

  @override
  List<Object> get props => [oficialStoreId, priceTableCode];
}

class UpdatePriceEvent extends DiscountPresentationEvent {
  final num oficialStoreId;
  final num priceTableCode;
  final Reference? reference;
  final int quantity;
  final List<ProductPrice?> prices;
  final List<SalesOrder>? bagOrders;

  const UpdatePriceEvent({
    required this.oficialStoreId,
    required this.priceTableCode,
    required this.reference,
    required this.prices,
    required this.quantity,
    this.bagOrders,
  });

  @override
  List<Object> get props => [];
}

class ResetDiscountsEvent extends DiscountPresentationEvent {
  const ResetDiscountsEvent();

  @override
  List<Object> get props => [];
}
