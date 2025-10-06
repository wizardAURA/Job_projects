import 'dart:math';
import '../models/restaurant.dart';
import '../models/menu_item.dart';

class FoodRepository {
  final List<Restaurant> _restaurants = [
    Restaurant(
      id: '1',
      name: 'Spice Heaven',
      imageUrl: 'https://images.unsplash.com/photo-1552566626-52f8b828add9',
      cuisine: 'Indian',
      rating: 4.5,
    ),
    Restaurant(
      id: '2',
      name: 'Pasta Palace',
      imageUrl: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1',
      cuisine: 'Italian',
      rating: 4.8,
    ),
    Restaurant(
      id: '3',
      name: 'Sushi Central',
      imageUrl: 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351',
      cuisine: 'Japanese',
      rating: 4.6,
    ),
  ];

  final Map<String, List<MenuItem>> _menus = {
    '1': [
      const MenuItem(
        id: 'm1',
        name: 'Chicken Tikka Masala',
        description: 'Creamy and rich tomato curry',
        price: 14.99,
      ),
      const MenuItem(
        id: 'm2',
        name: 'Palak Paneer',
        description: 'Spinach with cottage cheese',
        price: 12.50,
      ),
      const MenuItem(
        id: 'm3',
        name: 'Garlic Naan',
        description: 'Soft leavened bread with garlic',
        price: 3.99,
      ),
    ],
    '2': [
      const MenuItem(
        id: 'm4',
        name: 'Spaghetti Carbonara',
        description: 'Creamy pasta with bacon',
        price: 13.50,
      ),
      const MenuItem(
        id: 'm5',
        name: 'Margherita Pizza',
        description: 'Classic cheese and tomato pizza',
        price: 11.99,
      ),
    ],
    '3': [
      const MenuItem(
        id: 'm6',
        name: 'California Roll',
        description: 'Crab, avocado, and cucumber',
        price: 8.99,
      ),
      const MenuItem(
        id: 'm7',
        name: 'Spicy Tuna Roll',
        description: 'Tuna with spicy mayo',
        price: 9.50,
      ),
    ],
  };

  Future<List<Restaurant>> getRestaurants() async {
    await Future.delayed(const Duration(seconds: 1));
    if (Random().nextBool()) {
      // throw Exception('Failed to load restaurants. Please try again later.');
    }
    return _restaurants;
  }

  Future<List<MenuItem>> getMenu(String restaurantId) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _menus[restaurantId] ?? [];
  }

  Future<String> placeOrder(List<dynamic> items) async {
    await Future.delayed(const Duration(seconds: 2));
    if (Random().nextBool()) {
      throw Exception('Order could not be placed. Payment failed.');
    }
    return 'order_${Random().nextInt(10000)}'; // Return a dummy order ID
  }
}
