import 'package:flutter/material.dart';
import 'app_routes.dart';
import 'screens/home_screen.dart';
import 'screens/playlist_screen.dart';
import 'screens/settings_screen.dart';

void main() {
runApp(const MyMusicApp());
}

class MyMusicApp extends StatelessWidget {
const MyMusicApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'My Music App',

routes: {
AppRoutes.home: (context) => const HomeScreen(),
AppRoutes.playlist: (context) => const PlaylistScreen(),
AppRoutes.settings: (context) => const SettingsScreen(),
},

initialRoute: AppRoutes.home,
);
}
}
