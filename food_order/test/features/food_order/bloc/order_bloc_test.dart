import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:food_order/data/models/cart.dart';
import 'package:food_order/data/models/menu_item.dart';
import 'package:food_order/features/food_order/bloc/order_bloc/order_bloc.dart';
import 'package:food_order/features/food_order/bloc/order_bloc/order_event.dart';
import 'package:food_order/features/food_order/bloc/order_bloc/order_state.dart';
// Joel reuse the file from restaurent test
import 'restaurant_bloc_test.mocks.dart';

void main() {
  late MockFoodRepository mockFoodRepository;
  late OrderBloc orderBloc;

  final tCartItems = [
    const CartItem(
      menuItem: MenuItem(
        id: '1',
        name: 'Item',
        description: 'desc',
        price: 10.0,
      ),
    ),
  ];
  const tOrderId = 'order_123';

  setUp(() {
    mockFoodRepository = MockFoodRepository();
    orderBloc = OrderBloc(mockFoodRepository);
  });

  tearDown(() => orderBloc.close());

  test('initial state is OrderInitial', () {
    expect(orderBloc.state, OrderInitial());
  });

  group('PlaceOrder Event', () {
    blocTest<OrderBloc, OrderState>(
      'emits [OrderPlacing, OrderPlacedSuccessfully] on success.',
      build: () {
        when(
          mockFoodRepository.placeOrder(any),
        ).thenAnswer((_) async => tOrderId);
        return orderBloc;
      },
      act: (bloc) => bloc.add(PlaceOrder(tCartItems)),
      expect: () => [OrderPlacing(), const OrderPlacedSuccessfully(tOrderId)],
      verify: (_) => verify(mockFoodRepository.placeOrder(tCartItems)),
    );

    blocTest<OrderBloc, OrderState>(
      'emits [OrderPlacing, OrderPlacementError] on failure.',
      build: () {
        when(
          mockFoodRepository.placeOrder(any),
        ).thenThrow(Exception('Payment failed'));
        return orderBloc;
      },
      act: (bloc) => bloc.add(PlaceOrder(tCartItems)),
      expect: () => [
        OrderPlacing(),
        const OrderPlacementError('Payment failed'),
      ],
    );
  });
}
