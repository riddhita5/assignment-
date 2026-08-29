import 'package:flutter/material.dart';
import 'env_constants.dart';

void main() {
  print("Development URL: ${EnvConstants.developmentBaseUrl}");
  print("Staging URL: ${EnvConstants.stagingBaseUrl}");
  print("Production URL: ${EnvConstants.productionBaseUrl}");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Environment Constants"),
        ),
        body: const Center(
          child: Text(
            "Check the console for API URLs",
          ),
        ),
      ),
    );
  }
}
