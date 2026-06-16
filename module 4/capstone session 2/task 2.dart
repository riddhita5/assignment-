import 'package:flutter/material.dart';

class TabDemoScreen extends StatelessWidget {
  const TabDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

        body: const TabBarView(
          children: [
            // Trending Tab
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.trending_up,
                    size: 80,
                    color: Colors.orange,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Trending Shows & Events",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),

            // Favorites Tab
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    size: 80,
                    color: Colors.red,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Your Favorite Picks",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),

            // Nearby Tab
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 80,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Nearby Places & Events",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}