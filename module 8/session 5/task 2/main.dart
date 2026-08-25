import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:module_7/services/food_delivery_service.dart';


final getIt = GetIt.instance;

void main() {

  // Register service
  getIt.registerLazySingleton<FoodDeliveryApiService>(
        () => FoodDeliveryApiService(),
  );

  // Get service from GetIt
  final foodService =
  getIt<FoodDeliveryApiService>();

  // Fetch restaurants
  final restaurants =
  foodService.fetchPopularRestaurants();

  // Print restaurants
  print('Popular Restaurants:');

  for (final restaurant in restaurants) {
    print(restaurant);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Food Delivery App',
          ),
        ),
        body: const Center(
          child: Text(
            'Check Debug Console',
          ),
        ),
      ),
    );
  }
}
