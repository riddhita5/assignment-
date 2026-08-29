import 'package:flutter/material.dart';
import 'env_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentEnv = 'dev';

  String getBaseUrl() {
    switch (currentEnv) {
      case 'staging':
        return EnvConstants.stagingBaseUrl;

      case 'prod':
        return EnvConstants.productionBaseUrl;

      case 'dev':
      default:
        return EnvConstants.developmentBaseUrl;
    }
  }

  String getEnvironmentName() {
    switch (currentEnv) {
      case 'staging':
        return 'Staging';

      case 'prod':
        return 'Production';

      case 'dev':
      default:
        return 'Development';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Environment Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Environment',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            DropdownButton<String>(
              value: currentEnv,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'dev',
                  child: Text('Development'),
                ),
                DropdownMenuItem(
                  value: 'staging',
                  child: Text('Staging'),
                ),
                DropdownMenuItem(
                  value: 'prod',
                  child: Text('Production'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  currentEnv = value!;
                });
              },
            ),

            const SizedBox(height: 30),

            Text(
              'Current Environment: ${getEnvironmentName()}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              'API Base URL: ${getBaseUrl()}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}