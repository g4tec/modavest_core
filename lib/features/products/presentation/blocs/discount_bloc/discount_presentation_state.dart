part of 'discount_presentation_bloc.dart';

abstract class DiscountPresentationState extends Equatable {
  final Map<ProductPrice, double?> productPriceDiscountPrice;
  final bool showDiscounts;

  const DiscountPresentationState(
    this.productPriceDiscountPrice, {
    this.showDiscounts = false,
  });

  @override
  List<Object> get props => [productPriceDiscountPrice];
}

class DiscountPresentationInitial extends DiscountPresentationState {
  const DiscountPresentationInitial(
    super.productPriceDiscountPrice,
  );
}

class DiscountPrice extends DiscountPresentationState {
  const DiscountPrice(super.productPriceDiscountPrice, {super.showDiscounts});

  @override
  List<Object> get props => [productPriceDiscountPrice];
}

class UpdatingPrices extends DiscountPresentationState {
  const UpdatingPrices(super.productPriceDiscountPrice);

  @override
  List<Object> get props => [productPriceDiscountPrice];
}
