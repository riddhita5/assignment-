import 'package:flutter/material.dart';

class DashboardScreen3 extends StatelessWidget {
  const DashboardScreen3({super.key});

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
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Trending Restaurants"),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(12),
        childAspectRatio: 0.9,
        children: restaurants.map((restaurant) {
          return Card(
            elevation: 4,
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "${restaurant["name"]} selected",
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      child: Icon(
                        Icons.restaurant,
                        size: 30,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      restaurant["name"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      restaurant["cuisine"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          restaurant["rating"].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}