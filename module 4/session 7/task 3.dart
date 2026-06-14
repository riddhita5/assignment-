import 'package:flutter/material.dart';


class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation Drawer Demo"),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/150?img=3",
                ),
              ),
              accountName: Text("Riddhita Gosai"),
              accountEmail: Text("riddhita@example.com"),
            ),

            // My Orders
            ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text("My Orders"),
              onTap: () {
                Navigator.pop(context); // Close drawer

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyOrdersScreen(),
                  ),
                );
              },
            ),

            // Favourites
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text("Favourites"),
              onTap: () {
                Navigator.pop(context); // Close drawer

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavouritesScreen(),
                  ),
                );
              },
            ),

            // Logout
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Logged out successfully"),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      body: const Center(
        child: Text(
          "Home Screen",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// My Orders Screen
class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
      ),
      body: const Center(
        child: Text(
          "You are in My Orders Section",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}

// Favourites Screen
class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
      ),
      body: const Center(
        child: Text(
          "You are in Favourites Section",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}