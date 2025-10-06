import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:food_order/data/models/restaurant.dart';
import 'package:food_order/data/repository/food_repository.dart';
import 'package:food_order/features/food_order/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:food_order/features/food_order/bloc/restaurant_bloc/restaurant_event.dart';
import 'package:food_order/features/food_order/bloc/restaurant_bloc/restaurant_state.dart';

@GenerateMocks([FoodRepository])
import 'restaurant_bloc_test.mocks.dart';

void main() {
  late MockFoodRepository mockFoodRepository;
  late RestaurantBloc restaurantBloc;

  final tRestaurants = [
    const Restaurant(
      id: '1',
      name: 'Test Food',
      imageUrl: 'url',
      cuisine: 'Test',
      rating: 5.0,
    ),
  ];
  final tException = Exception('Failed to load');

  setUp(() {
    mockFoodRepository = MockFoodRepository();
    restaurantBloc = RestaurantBloc(mockFoodRepository);
  });

  tearDown(() {
    restaurantBloc.close();
  });

  test('initial state should be RestaurantInitial', () {
    expect(restaurantBloc.state, RestaurantInitial());
  });

  group('FetchRestaurants Event', () {
    blocTest<RestaurantBloc, RestaurantState>(
      'emits [RestaurantLoading, RestaurantLoaded] when getRestaurants is successful.',
      build: () {
        when(
          mockFoodRepository.getRestaurants(),
        ).thenAnswer((_) async => tRestaurants);
        return restaurantBloc;
      },

      act: (bloc) => bloc.add(FetchRestaurants()),
      expect: () => [RestaurantLoading(), RestaurantLoaded(tRestaurants)],
      verify: (_) {
        verify(mockFoodRepository.getRestaurants()).called(1);
      },
    );

    blocTest<RestaurantBloc, RestaurantState>(
      'emits [RestaurantLoading, RestaurantError] when getRestaurants fails.',
      build: () {
        when(mockFoodRepository.getRestaurants()).thenThrow(tException);
        return restaurantBloc;
      },
      act: (bloc) => bloc.add(FetchRestaurants()),
      expect: () => [
        RestaurantLoading(),
        RestaurantError(tException.toString().replaceFirst("Exception: ", "")),
      ],
    );
  });
}
