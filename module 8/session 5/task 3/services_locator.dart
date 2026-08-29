import 'package:get_it/get_it.dart';
import 'food_delivery_api_service.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<FoodDeliveryApiService>(
        () => FoodDeliveryApiService(),
  );
}