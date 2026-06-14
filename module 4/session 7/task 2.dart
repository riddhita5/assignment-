import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

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
                Navigator.pop(context);
              },
            ),

            // Favourites
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text("Favourites"),
              onTap: () {
                Navigator.pop(context);
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
          "Open the drawer to view menu items",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}