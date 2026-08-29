import 'package:flutter/material.dart';
import 'env_constants.dart';

void main() {
  // Change this to: 'dev', 'staging', or 'prod'
  const String currentEnv = 'dev';

  String baseUrl;

  switch (currentEnv) {
    case 'dev':
      baseUrl = EnvConstants.developmentBaseUrl;
      break;

    case 'staging':
      baseUrl = EnvConstants.stagingBaseUrl;
      break;

    case 'prod':
      baseUrl = EnvConstants.productionBaseUrl;
      break;

    default:
      baseUrl = EnvConstants.developmentBaseUrl;
  }

  print('Current Environment: $currentEnv');
  print('API Base URL: $baseUrl');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Environment Switching'),
        ),
      ),
    );
  }
}
