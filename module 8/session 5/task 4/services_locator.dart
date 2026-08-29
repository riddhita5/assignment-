import 'package:get_it/get_it.dart';
import 'food_delivery_api_service.dart';
import '../restaurant_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<FoodDeliveryApiService>(
        () => FoodDeliveryApiService(),
  );

  getIt.registerFactory<RestaurantBloc>(
        () => RestaurantBloc(
      getIt<FoodDeliveryApiService>(),
    ),
  );
}