import 'package:equatable/equatable.dart';
import 'menu_item.dart';

class CartItem extends Equatable {
  final MenuItem menuItem;
  final int quantity;

  const CartItem({required this.menuItem, this.quantity = 1});

  CartItem copyWith({int? quantity}) {
    return CartItem(menuItem: menuItem, quantity: quantity ?? this.quantity);
  }

  double get totalPrice => menuItem.price * quantity;

  @override
  List<Object?> get props => [menuItem, quantity];
}
