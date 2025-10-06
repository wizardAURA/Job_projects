import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/restaurant.dart';
import '../../../data/repository/food_repository.dart';
import '../bloc/menu_bloc/menu_bloc.dart';
import '../bloc/menu_bloc/menu_event.dart';
import '../bloc/menu_bloc/menu_state.dart';
import '../widgets/menu_item_tile.dart';

class MenuScreen extends StatelessWidget {
  final Restaurant restaurant;

  const MenuScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(restaurant.name)),
      body: BlocProvider(
        create: (context) =>
            MenuBloc(RepositoryProvider.of<FoodRepository>(context))
              ..add(FetchMenu(restaurant.id)),
        child: BlocBuilder<MenuBloc, MenuState>(
          builder: (context, state) {
            if (state is MenuLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is MenuLoaded) {
              if (state.menuItems.isEmpty) {
                return const Center(
                  child: Text('This restaurant has no items available.'),
                );
              }
              return ListView.builder(
                itemCount: state.menuItems.length,
                itemBuilder: (context, index) {
                  return MenuItemTile(menuItem: state.menuItems[index]);
                },
              );
            }
            if (state is MenuError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
