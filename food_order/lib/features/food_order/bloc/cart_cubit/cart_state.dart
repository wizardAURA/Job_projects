import 'package:equatable/equatable.dart';
import '../../../../data/models/cart.dart';

class CartState extends Equatable {
  final List<CartItem> items;
  final double total;

  const CartState({this.items = const [], this.total = 0.0});

  @override
  List<Object> get props => [items, total];
}
