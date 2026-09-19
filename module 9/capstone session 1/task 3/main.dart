import 'package:flutter/material.dart';
import 'package:instafeedclone/screens/dashboard.dart';
import 'package:instafeedclone/screens/login.dart';
import 'package:instafeedclone/screens/splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Change this value to test the flow
  final bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insta Clone Shell',

      // Named routes
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
      },

      // App starts from SplashScreen
      initialRoute: '/splash',
    );
  }
}
