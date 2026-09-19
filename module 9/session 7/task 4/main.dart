import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RestaurantSearchScreen(),
    );
  }
}

class RestaurantSearchScreen extends StatefulWidget {
  const RestaurantSearchScreen({super.key});

  @override
  State<RestaurantSearchScreen> createState() =>
      _RestaurantSearchScreenState();
}

class _RestaurantSearchScreenState
    extends State<RestaurantSearchScreen> {

  final TextEditingController searchController = TextEditingController();

  final List<String> restaurants = [
    'Pizza Hut',
    'Dominos',
    'Burger King',
    'McDonalds',
    'Subway',
    'Cafe Coffee Day',
    'Honest Restaurant',
    'La Pino Pizza',
  ];

  List<String> filteredRestaurants = [];

  @override
  void initState() {
    super.initState();

    filteredRestaurants = restaurants;

    searchController.addListener(filterRestaurants);
  }

  void filterRestaurants() {
    final searchText = searchController.text.toLowerCase();

    setState(() {
      filteredRestaurants = restaurants.where((restaurant) {
        return restaurant.toLowerCase().contains(searchText);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.removeListener(filterRestaurants);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search restaurants...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: filteredRestaurants.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.restaurant),
                    title: Text(
                      filteredRestaurants[index],
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
