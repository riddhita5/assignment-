import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Delivery App"),
      ),

      // Side Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.person,
                      size: 35,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome User",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "user@example.com",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // My Wallet
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text("My Wallet"),
              onTap: () {
                Navigator.pop(context); // Close drawer

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const PlaceholderScreen(
                      title: "My Wallet",
                    ),
                  ),
                );
              },
            ),

            // Offers
            ListTile(
              leading: const Icon(Icons.local_offer),
              title: const Text("Offers"),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const PlaceholderScreen(
                      title: "Offers",
                    ),
                  ),
                );
              },
            ),

            // Settings
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const PlaceholderScreen(
                      title: "Settings",
                    ),
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

// Common Placeholder Screen
class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: Center(
        child: Text(
          "You are in $title Screen",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}