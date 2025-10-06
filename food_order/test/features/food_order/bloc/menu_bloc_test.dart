import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:food_order/data/models/menu_item.dart';
import 'package:food_order/features/food_order/bloc/menu_bloc/menu_bloc.dart';
import 'package:food_order/features/food_order/bloc/menu_bloc/menu_event.dart';
import 'package:food_order/features/food_order/bloc/menu_bloc/menu_state.dart';

// Joel reuse the file from restaurent test
import 'restaurant_bloc_test.mocks.dart';

void main() {
  late MockFoodRepository mockFoodRepository;
  late MenuBloc menuBloc;

  const tRestaurantId = '1';
  final tMenuItems = [
    const MenuItem(
      id: 'm1',
      name: 'Test Item',
      description: 'desc',
      price: 9.99,
    ),
  ];

  setUp(() {
    mockFoodRepository = MockFoodRepository();
    menuBloc = MenuBloc(mockFoodRepository);
  });

  tearDown(() => menuBloc.close());

  test('initial state should be MenuInitial', () {
    expect(menuBloc.state, MenuInitial());
  });

  group('FetchMenu Event', () {
    blocTest<MenuBloc, MenuState>(
      'emits [MenuLoading, MenuLoaded] on success.',
      build: () {
        when(
          mockFoodRepository.getMenu(any),
        ).thenAnswer((_) async => tMenuItems);
        return menuBloc;
      },
      act: (bloc) => bloc.add(FetchMenu(tRestaurantId)),
      expect: () => [MenuLoading(), MenuLoaded(tMenuItems)],
      verify: (_) => verify(mockFoodRepository.getMenu(tRestaurantId)),
    );

    blocTest<MenuBloc, MenuState>(
      'emits [MenuLoading, MenuError] on failure.',
      build: () {
        when(mockFoodRepository.getMenu(any)).thenThrow(Exception('Failed'));
        return menuBloc;
      },
      act: (bloc) => bloc.add(FetchMenu(tRestaurantId)),
      expect: () => [MenuLoading(), const MenuError('Exception: Failed')],
    );
  });
}
