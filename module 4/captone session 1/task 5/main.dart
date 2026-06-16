import 'package:flutter/material.dart';
import 'package:module4/capstone%20session%201/task%205/category_grid_item.dart';
import 'package:module4/capstone%20session%201/task%205/service_list_item.dart';

void main() {
  runApp(MaterialApp(home: HomePage5()));
      }

class HomePage5 extends StatefulWidget {
  const HomePage5({super.key});

  @override
  State<HomePage5> createState() => _HomePage5State();
}

class _HomePage5State extends State<HomePage5> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> services = [
    {
      "name": "Food Delivery",
      "icon": Icons.delivery_dining,
      "description": "Order food from nearby restaurants.",
    },
    {
      "name": "Movie Tickets",
      "icon": Icons.movie,
      "description": "Book tickets for the latest movies.",
    },
    {
      "name": "Mobile Recharge",
      "icon": Icons.phone_android,
      "description": "Recharge your mobile instantly.",
    },
    {
      "name": "Train Booking",
      "icon": Icons.train,
      "description": "Book train tickets easily.",
    },
    {
      "name": "IPL Fantasy",
      "icon": Icons.sports_cricket,
      "description": "Play fantasy cricket contests.",
    },
  ];

  final List<Map<String, String>> categories = [
    {
      "name": "Food",
      "image": "https://picsum.photos/300?1",
      "description": "Explore food services.",
    },
    {
      "name": "Travel",
      "image": "https://picsum.photos/300?2",
      "description": "Plan your next trip.",
    },
    {
      "name": "Shopping",
      "image": "https://picsum.photos/300?3",
      "description": "Shop from top brands.",
    },
    {
      "name": "Entertainment",
      "image": "https://picsum.photos/300?4",
      "description": "Enjoy movies and events.",
    },
    {
      "name": "Payments",
      "image": "https://picsum.photos/300?5",
      "description": "Pay bills securely.",
    },
    {
      "name": "Sports",
      "image": "https://picsum.photos/300?6",
      "description": "Stay updated with sports.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (selectedIndex == 0) {
      body = ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];

          return ServiceListItem(
            icon: service["icon"],
            name: service["name"],
            description: service["description"],
          );
        },
      );
    } else if (selectedIndex == 1) {
      body = GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: categories.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];

          return CategoryGridItem(
            name: category["name"]!,
            image: category["image"]!,
            description: category["description"]!,
          );
        },
      );
    } else {
      body = const Center(
        child: Text(
          "Profile Screen",
          style: TextStyle(fontSize: 24),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("ServiceHub"),
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
            icon: Icon(Icons.explore),
            label: "Explore",
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