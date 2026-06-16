import 'package:flutter/material.dart';

class HomePage3 extends StatefulWidget {
  const HomePage3({super.key});

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> trendingServices = [
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

  final List<Map<String, String>> categories = [
    {
      "name": "Food",
      "image":
      "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
    },
    {
      "name": "Travel",
      "image":
      "https://images.unsplash.com/photo-1488646953014-85cb44e25828",
    },
    {
      "name": "Shopping",
      "image":
      "https://images.unsplash.com/photo-1512436991641-6745cdb1723f",
    },
    {
      "name": "Entertainment",
      "image":
      "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba",
    },
    {
      "name": "Payments",
      "image":
      "https://images.unsplash.com/photo-1556740749-887f6717d7e4",
    },
    {
      "name": "Sports",
      "image":
      "https://images.unsplash.com/photo-1540747913346-19e32dc3e97e",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Widget body;

    // Home Tab
    if (selectedIndex == 0) {
      body = ListView.builder(
        itemCount: trendingServices.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: ListTile(
              leading: Icon(
                trendingServices[index]["icon"],
                color: Colors.blue,
              ),
              title: Text(
                trendingServices[index]["name"],
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      );
    }

    // Explore Tab
    else if (selectedIndex == 1) {
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
          return Card(
            elevation: 4,
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    categories[index]["image"]!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    categories[index]["name"]!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    // Profile Tab
    else {
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