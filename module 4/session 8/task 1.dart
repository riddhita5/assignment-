import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> restaurants = [
      {
        "name": "Pizza Hut",
        "cuisine": "Italian, Fast Food",
        "rating": 4.5,
      },
      {
        "name": "McDonald's",
        "cuisine": "Burgers, Fast Food",
        "rating": 4.3,
      },
      {
        "name": "Domino's",
        "cuisine": "Pizza, Italian",
        "rating": 4.4,
      },
      {
        "name": "The Dosa House",
        "cuisine": "South Indian",
        "rating": 4.6,
      },
      {
        "name": "Biryani Blues",
        "cuisine": "Biryani, Mughlai",
        "rating": 4.2,
      },
      {
        "name": "Subway",
        "cuisine": "Sandwiches, Healthy Food",
        "rating": 4.1,
      },
      {
        "name": "KFC",
        "cuisine": "Chicken, Fast Food",
        "rating": 4.4,
      },
      {
        "name": "Barbeque Nation",
        "cuisine": "BBQ, North Indian",
        "rating": 4.7,
      },
      {
        "name": "Haldiram's",
        "cuisine": "Indian, Snacks",
        "rating": 4.3,
      },
      {
        "name": "Wow! Momo",
        "cuisine": "Chinese, Momos",
        "rating": 4.2,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Trending Restaurants"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];

          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            elevation: 3,
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.restaurant),
              ),
              title: Text(
                restaurant["name"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                restaurant["cuisine"],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    restaurant["rating"].toString(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
