import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:food_order/data/models/cart.dart';
import 'package:food_order/data/models/menu_item.dart';
import 'package:food_order/features/food_order/bloc/cart_cubit/cart_cubit.dart';
import 'package:food_order/features/food_order/bloc/cart_cubit/cart_state.dart';

void main() {
  late CartCubit cartCubit;

  const tMenuItem1 = MenuItem(
    id: '1',
    name: 'Item 1',
    description: 'desc',
    price: 10.0,
  );
  const tMenuItem2 = MenuItem(
    id: '2',
    name: 'Item 2',
    description: 'desc',
    price: 5.0,
  );

  setUp(() {
    cartCubit = CartCubit();
  });

  tearDown(() => cartCubit.close());

  test('initial state is CartState() with empty items and total 0.0', () {
    expect(cartCubit.state, const CartState(items: [], total: 0.0));
  });

  group('addItem', () {
    blocTest<CartCubit, CartState>(
      'emits a new state with the added item and updated total.',
      build: () => cartCubit,
      act: (cubit) => cubit.addItem(tMenuItem1),
      expect: () => [
        const CartState(items: [CartItem(menuItem: tMenuItem1)], total: 10.0),
      ],
    );

    blocTest<CartCubit, CartState>(
      'emits a new state with increased quantity if item already exists.',
      build: () => cartCubit,
      // Seed the state with one item already in the cart
      seed: () =>
          const CartState(items: [CartItem(menuItem: tMenuItem1)], total: 10.0),
      act: (cubit) => cubit.addItem(tMenuItem1),
      expect: () => [
        const CartState(
          items: [CartItem(menuItem: tMenuItem1, quantity: 2)],
          total: 20.0,
        ),
      ],
    );
  });

  group('removeItem', () {
    blocTest<CartCubit, CartState>(
      'emits state with decreased quantity if quantity > 1.',
      build: () => cartCubit,
      seed: () => const CartState(
        items: [CartItem(menuItem: tMenuItem1, quantity: 2)],
        total: 20.0,
      ),
      act: (cubit) => cubit.removeItem(tMenuItem1),
      expect: () => [
        const CartState(
          items: [CartItem(menuItem: tMenuItem1, quantity: 1)],
          total: 10.0,
        ),
      ],
    );

    blocTest<CartCubit, CartState>(
      'emits state with item removed if quantity is 1.',
      build: () => cartCubit,
      seed: () => const CartState(
        items: [CartItem(menuItem: tMenuItem1, quantity: 1)],
        total: 10.0,
      ),
      act: (cubit) => cubit.removeItem(tMenuItem1),
      expect: () => [const CartState(items: [], total: 0.0)],
    );
  });

  group('clearCart', () {
    blocTest<CartCubit, CartState>(
      'emits an empty CartState.',
      build: () => cartCubit,
      seed: () =>
          const CartState(items: [CartItem(menuItem: tMenuItem1)], total: 10.0),
      act: (cubit) => cubit.clearCart(),
      expect: () => [const CartState(items: [], total: 0.0)],
    );
  });
}
