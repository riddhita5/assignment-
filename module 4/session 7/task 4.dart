import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spotify Style Drawer"),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Color(0xFF1DB954),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),

              currentAccountPicture: const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/150?img=3",
                ),
              ),

              accountName: const Text(
                "Riddhita Gosai",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              accountEmail: const Text(
                "riddhita@example.com",
              ),
            ),

            ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text("My Orders"),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text("Favourites"),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {},
            ),
          ],
        ),
      ),

      body: const Center(
        child: Text(
          "Open the Drawer",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}