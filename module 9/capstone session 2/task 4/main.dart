import 'package:flutter/material.dart';
import 'package:instafeedclone/providers/auth%20provider.dart';
import 'package:instafeedclone/screens/dashboard.dart';
import 'package:instafeedclone/screens/login.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const AuthWrapper(),
    );
  }
}

// Decides which screen to show
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.watch<AuthProvider>().isLoggedIn;

    if (isLoggedIn) {
      return const DashboardScreen();
    }

    return const LoginScreen();
  }
}
