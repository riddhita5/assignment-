import 'dart:convert';
import 'package:flutter/material.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Restaurant App"),
      ),
    );
  }
}

void getRestaurantData() {


  String jsonString = '''
  {
    "id": 101,
    "name": "Spice Garden",
    "cuisine": "North Indian"
  }
  ''';

  Map<String, dynamic> restaurant = jsonDecode(jsonString);

  print(restaurant["name"]);
  print(restaurant["cuisine"]);
}
