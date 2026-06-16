import 'package:flutter/material.dart';

class DashboardScreen2 extends StatefulWidget {
  const DashboardScreen2({super.key});

  @override
  State<DashboardScreen2> createState() => _DashboardScreen2State();
}

class _DashboardScreen2State extends State<DashboardScreen2> {
  int selectedIndex = 0;

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
  ];

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (selectedIndex == 0) {
      body = ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];

          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
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
              subtitle: Text(restaurant["cuisine"]),
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
      );
    } else if (selectedIndex == 1) {
      body = const Center(
        child: Text(
          "Orders Screen",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      body = const Center(
        child: Text(
          "Profile Screen",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Delivery App"),
        centerTitle: true,
      ),

      body: body,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}