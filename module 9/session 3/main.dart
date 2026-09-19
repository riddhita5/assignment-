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
      home: const SelectCityScreen(),
    );
  }
}


class SelectCityScreen extends StatelessWidget {
  const SelectCityScreen({super.key});

  final List<String> cities = const [
    'Ahmedabad',
    'Surat',
    'Vadodara',
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
          return ListTile(
            title: Text(
              cities[index],
              style: const TextStyle(fontSize: 20),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WeatherScreen(
                    city: cities[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


class WeatherScreen extends StatelessWidget {
  final String city;

  const WeatherScreen({
    super.key,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Center(
        child: Text(
          'Weather in $city',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
