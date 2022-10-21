import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:modavest_core/domain/models/product_price.dart';
import 'package:modavest_core/domain/models/reference.dart';
import 'package:modavest_core/domain/models/sales_order.dart';

part 'discount_presentation_event.dart';
part 'discount_presentation_state.dart';

abstract class DiscountPresentationBloc
    extends Bloc<DiscountPresentationEvent, DiscountPresentationState> {
  DiscountPresentationBloc() : super(const DiscountPresentationInitial({}));
}
