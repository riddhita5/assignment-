import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'delete_file_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const DeleteFileApp());
}

class DeleteFileApp extends StatelessWidget {
  const DeleteFileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Storage Delete (Task 5)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
      ),
      home: const DeleteFileScreen(),
    );
  }
}
