import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/food_repository.dart';
import '../bloc/restaurant_bloc/restaurant_bloc.dart';
import '../bloc/restaurant_bloc/restaurant_event.dart';
import '../bloc/restaurant_bloc/restaurant_state.dart';
import '../widgets/restaurant_card.dart';
import 'cart_screen.dart';

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Restaurants'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const CartScreen()));
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) =>
            RestaurantBloc(RepositoryProvider.of<FoodRepository>(context))
              ..add(FetchRestaurants()),
        child: BlocBuilder<RestaurantBloc, RestaurantState>(
          builder: (context, state) {
            if (state is RestaurantLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is RestaurantLoaded) {
              return ListView.builder(
                itemCount: state.restaurants.length,
                itemBuilder: (context, index) {
                  return RestaurantCard(restaurant: state.restaurants[index]);
                },
              );
            }
            if (state is RestaurantError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red.shade300,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<RestaurantBloc>().add(FetchRestaurants());
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: Text('Welcome!'));
          },
        ),
      ),
    );
  }
}
