
import 'package:flutter/material.dart';

class HomeScreen11 extends StatelessWidget {
  const HomeScreen11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ServiceHub"),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/150?img=5",
                ),
              ),
              accountName: const Text(
                "Riddhita Gosai",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: const Text(
                "riddhita@example.com",
              ),
              decoration: const BoxDecoration(
                color: Colors.red, // Similar to Zomato theme
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text("My Orders"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text("Favourites"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            const Divider(),

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
          "Swipe from the left or tap the menu icon",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
