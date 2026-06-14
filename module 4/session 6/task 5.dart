import 'package:flutter/material.dart';

class PlaylistScreen4 extends StatelessWidget {
  PlaylistScreen4({super.key});

  final List<String> tabNames = [
    'Favourites',
    'Trending',
    'Downloaded',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabNames.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Playlist"),
          bottom: TabBar(
            tabs: tabNames.map((tab) {
              return Tab(text: tab);
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: tabNames.map((tab) {
            return Center(
              child: Text(
                "$tab Songs",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}