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
      home: const FoodMenuScreen(),
    );
  }
}

class FoodMenuScreen extends StatelessWidget {
  const FoodMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1000 food items
    final List<String> foodItems = List.generate(
      1000,
          (index) => 'Food Item ${index + 1}',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Menu'),
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.fastfood),
            title: Text(foodItems[index]),
            subtitle: const Text('Delicious food'),
          );
        },
      ),
    );
  }
}
