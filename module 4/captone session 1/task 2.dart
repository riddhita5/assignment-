import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> services = [
    {
      "name": "Food Delivery",
      "icon": Icons.delivery_dining,
    },
    {
      "name": "Movie Tickets",
      "icon": Icons.movie,
    },
    {
      "name": "Mobile Recharge",
      "icon": Icons.phone_android,
    },
    {
      "name": "Train Booking",
      "icon": Icons.train,
    },
    {
      "name": "IPL Fantasy",
      "icon": Icons.sports_cricket,
    },
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (selectedIndex == 0) {
      // Home Tab
      body = ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: ListTile(
              leading: Icon(
                services[index]["icon"],
                color: Colors.blue,
                size: 30,
              ),
              title: Text(
                services[index]["name"],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      );
    } else if (selectedIndex == 1) {
      // Explore Tab
      body = const Center(
        child: Text(
          "Explore Screen",
          style: TextStyle(fontSize: 24),
        ),
      );
    } else {
      // Profile Tab
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
        centerTitle: true,
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
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