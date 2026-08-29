import 'package:flutter/material.dart';
import 'env_constants.dart';

void main() {
  print(EnvConstants.developmentBaseUrl);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('My Flutter App'),
        ),
      ),
    );
  }
}
