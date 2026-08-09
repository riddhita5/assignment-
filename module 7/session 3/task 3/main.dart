import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:module_7/register%20page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initializing Firebase without the missing 'firebase_options.dart' file.
  // On Android, it will use the 'google-services.json' configuration automatically.
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
