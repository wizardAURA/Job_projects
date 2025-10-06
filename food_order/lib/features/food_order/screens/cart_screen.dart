import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/food_repository.dart';
import '../bloc/cart_cubit/cart_cubit.dart';
import '../bloc/cart_cubit/cart_state.dart';
import '../bloc/order_bloc/order_bloc.dart';
import '../bloc/order_bloc/order_event.dart';
import '../bloc/order_bloc/order_state.dart';
import 'order_confirmation_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OrderBloc(RepositoryProvider.of<FoodRepository>(context)),
      child: Scaffold(
        appBar: AppBar(title: const Text('Your Cart')),
        body: BlocListener<OrderBloc, OrderState>(
          listener: (context, state) {
            if (state is OrderPlacedSuccessfully) {
              // Clear cart after successful order
              context.read<CartCubit>().clearCart();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (_) =>
                      OrderConfirmationScreen(orderId: state.orderId),
                ),
                (route) => route.isFirst,
              );
            } else if (state is OrderPlacementError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error: ${state.message}'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, cartState) {
              if (cartState.items.isEmpty) {
                return const Center(child: Text('Your cart is empty.'));
              }

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartState.items.length,
                      itemBuilder: (context, index) {
                        final item = cartState.items[index];
                        return ListTile(
                          title: Text(item.menuItem.name),
                          subtitle: Text('Quantity: ${item.quantity}'),
                          trailing: Text(
                            '\$${item.totalPrice.toStringAsFixed(2)}',
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total:',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${cartState.total.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: BlocBuilder<OrderBloc, OrderState>(
                            builder: (context, orderState) {
                              if (orderState is OrderPlacing) {
                                return const ElevatedButton(
                                  onPressed: null,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                );
                              }
                              return ElevatedButton(
                                onPressed: () {
                                  context.read<OrderBloc>().add(
                                    PlaceOrder(cartState.items),
                                  );
                                },
                                child: const Text('Place Order'),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
