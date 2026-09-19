import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCity = 'No city selected';

  Future<void> selectCity() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SelectCityScreen(),
      ),
    );

    setState(() {
      if (result == null || result.toString().trim().isEmpty) {
        selectedCity = 'No city selected';
      } else {
        selectedCity = result;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectedCity,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: selectCity,
              child: const Text('Select City'),
            ),
          ],
        ),
      ),
    );
  }
}


class SelectCityScreen extends StatelessWidget {
  const SelectCityScreen({super.key});

  final List<String> cities = const [
    'Ahmedabad',
    'Surat',
    'Vadodara',
    'Rajkot',
    'Gandhinagar',
    'Jamnagar',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select City'),
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          final String selectedCity = cities[index];

          return ListTile(
            leading: const Icon(Icons.location_city),
            title: Text(
              selectedCity,
              style: const TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context, selectedCity);
            },
          );
        },
      ),
    );
  }
}
