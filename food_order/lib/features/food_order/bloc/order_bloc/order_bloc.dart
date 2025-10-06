import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/repository/food_repository.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final FoodRepository foodRepository;

  OrderBloc(this.foodRepository) : super(OrderInitial()) {
    on<PlaceOrder>((event, emit) async {
      emit(OrderPlacing());
      try {
        final orderId = await foodRepository.placeOrder(event.items);
        emit(OrderPlacedSuccessfully(orderId));
      } catch (e) {
        emit(OrderPlacementError(e.toString().replaceFirst("Exception: ", "")));
      }
    });
  }
}
