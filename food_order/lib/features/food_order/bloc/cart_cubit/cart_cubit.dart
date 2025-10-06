import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/cart.dart';
import '../../../../data/models/menu_item.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void addItem(MenuItem item) {
    final List<CartItem> updatedItems = List.from(state.items);
    int index = updatedItems.indexWhere(
      (cartItem) => cartItem.menuItem.id == item.id,
    );

    if (index != -1) {
      // Item already in cart, increase quantity
      final currentItem = updatedItems[index];
      updatedItems[index] = currentItem.copyWith(
        quantity: currentItem.quantity + 1,
      );
    } else {
      // Add new item to cart
      updatedItems.add(CartItem(menuItem: item));
    }
    _updateState(updatedItems);
  }

  void removeItem(MenuItem item) {
    final List<CartItem> updatedItems = List.from(state.items);
    int index = updatedItems.indexWhere(
      (cartItem) => cartItem.menuItem.id == item.id,
    );

    if (index != -1) {
      final currentItem = updatedItems[index];
      if (currentItem.quantity > 1) {
        // Decrease quantity
        updatedItems[index] = currentItem.copyWith(
          quantity: currentItem.quantity - 1,
        );
      } else {
        // Remove item from cart
        updatedItems.removeAt(index);
      }
    }
    _updateState(updatedItems);
  }

  void clearCart() {
    emit(const CartState());
  }

  void _updateState(List<CartItem> items) {
    double total = items.fold(
      0.0,
      (sum, item) => sum + (item.menuItem.price * item.quantity),
    );
    emit(CartState(items: items, total: total));
  }
}
