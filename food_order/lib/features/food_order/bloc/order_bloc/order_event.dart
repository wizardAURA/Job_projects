import '../../../../data/models/cart.dart';

abstract class OrderEvent {}

class PlaceOrder extends OrderEvent {
  final List<CartItem> items;
  PlaceOrder(this.items);
}
