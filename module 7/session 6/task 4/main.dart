import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'recent_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const RecentImageApp());
}

class RecentImageApp extends StatelessWidget {
  const RecentImageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recent Profile (Task 4)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const RecentProfileScreen(),
    );
  }
}
