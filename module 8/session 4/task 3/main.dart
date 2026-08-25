import 'package:flutter/material.dart';
import 'presentation/restaurant_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zomato App',
      home: const RestaurantScreen(),
    );
  }
}
