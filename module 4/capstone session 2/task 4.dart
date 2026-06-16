import 'package:flutter/material.dart';

class HomeScreen15 extends StatelessWidget {
  const HomeScreen15({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Entertainment Hub"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.trending_up),
                text: "Trending",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: "Favorites",
              ),
              Tab(
                icon: Icon(Icons.location_on),
                text: "Nearby",
              ),
            ],
          ),
        ),

        // Navigation Drawer
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?img=5",
                  ),
                ),
                accountName: Text(
                  "Riddhita Gosai",
                  style: theme.textTheme.titleMedium,
                ),
                accountEmail: Text(
                  "riddhita@example.com",
                  style: theme.textTheme.bodyMedium,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.shopping_bag_outlined),
                  title: const Text("My Orders"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.favorite_border),
                  title: const Text("Favourites"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              const Divider(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.logout),
                  title: const Text("Logout"),
                  onTap: () {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Logged out successfully",
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // Tab Screens
        body: TabBarView(
          children: [
            // Trending Tab
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.trending_up,
                      size: theme
                          .textTheme
                          .displayMedium
                          ?.fontSize ??
                          48,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Trending Shows & Events",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            ),

            // Favorites Tab
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite,
                      size: theme
                          .textTheme
                          .displayMedium
                          ?.fontSize ??
                          48,
                      color: theme.colorScheme.secondary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Your Favorite Picks",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            ),

            // Nearby Tab
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: theme
                          .textTheme
                          .displayMedium
                          ?.fontSize ??
                          48,
                      color: theme.colorScheme.tertiary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Nearby Places & Events",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}