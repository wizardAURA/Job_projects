import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'data/repository/food_repository.dart';
import 'features/food_order/bloc/cart_cubit/cart_cubit.dart';
import 'features/food_order/screens/restaurant_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // We provide the repository and cart cubit at the top level
    // so they are available throughout the app.
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<FoodRepository>(
          create: (context) => FoodRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [BlocProvider<CartCubit>(create: (context) => CartCubit())],
        child: MaterialApp(
          title: 'Food Order App',
          theme: AppTheme.theme,
          debugShowCheckedModeBanner: false,
          home: const RestaurantListScreen(),
        ),
      ),
    );
  }
}
