import 'package:flutter/material.dart';
import 'package:module4/task%202/albumscreen.dart';
import 'package:module4/task%202/bottomnavscreen.dart';
import 'package:module4/task%202/profile%20screen.dart';
import 'package:module4/task%202/songs%20screen.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    SongsScreen(),
    AlbumsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Navigation Demo"),
      ),

      body: screens[selectedIndex],

      bottomNavigationBar: CustomBottomNav(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
