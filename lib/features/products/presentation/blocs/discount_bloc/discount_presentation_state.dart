part of 'discount_presentation_bloc.dart';

abstract class DiscountPresentationState extends Equatable {
  final Map<ProductPrice, double?> productPriceDiscountPrice;

  const DiscountPresentationState(this.productPriceDiscountPrice);

  @override
  List<Object> get props => [productPriceDiscountPrice];
}

class DiscountPresentationInitial extends DiscountPresentationState {
  const DiscountPresentationInitial(
    super.productPriceDiscountPrice,
  );
}

class DiscountPrice extends DiscountPresentationState {
  const DiscountPrice(super.productPriceDiscountPrice);

  @override
  List<Object> get props => [productPriceDiscountPrice];
}

class UpdatingPrices extends DiscountPresentationState {
  const UpdatingPrices(super.productPriceDiscountPrice);

  @override
  List<Object> get props => [productPriceDiscountPrice];
}
