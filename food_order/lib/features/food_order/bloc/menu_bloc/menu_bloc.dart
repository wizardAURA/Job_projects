import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/repository/food_repository.dart';
import 'menu_event.dart';
import 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final FoodRepository foodRepository;

  MenuBloc(this.foodRepository) : super(MenuInitial()) {
    on<FetchMenu>((event, emit) async {
      emit(MenuLoading());
      try {
        final menuItems = await foodRepository.getMenu(event.restaurantId);
        emit(MenuLoaded(menuItems));
      } catch (e) {
        emit(MenuError(e.toString()));
      }
    });
  }
}
