import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/repository/food_repository.dart';
import 'restaurant_event.dart';
import 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final FoodRepository foodRepository;

  RestaurantBloc(this.foodRepository) : super(RestaurantInitial()) {
    on<FetchRestaurants>((event, emit) async {
      emit(RestaurantLoading());
      try {
        final restaurants = await foodRepository.getRestaurants();
        emit(RestaurantLoaded(restaurants));
      } catch (e) {
        emit(RestaurantError(e.toString().replaceFirst("Exception: ", "")));
      }
    });
  }
}
