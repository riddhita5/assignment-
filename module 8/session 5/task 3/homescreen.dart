import 'package:flutter/material.dart';
import 'package:module_7/services/food_delivery_api_service.dart';
import 'package:module_7/services/services_locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FoodDeliveryApiService apiService;

  List<String> restaurantNames = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Get service from get_it
    apiService = getIt<FoodDeliveryApiService>();

    fetchRestaurants();
  }

  Future<void> fetchRestaurants() async {
    try {
      final restaurants = await apiService.fetchPopularRestaurants();

      setState(() {
        restaurantNames = restaurants
            .map<String>((restaurant) => restaurant.name)
            .toList();

        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      debugPrint("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurants"),
      ),
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: restaurantNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(restaurantNames[index]),
          );
        },
      ),
    );
  }
}