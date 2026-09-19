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

  final List<Map<String, String>> cities = const [
    {
      'city': 'Ahmedabad',
      'temperature': '34°C',
    },
    {
      'city': 'Surat',
      'temperature': '32°C',
    },
    {
      'city': 'Vadodara',
      'temperature': '31°C',
    },
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
              cities[index]['city']!,
              style: const TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              cities[index]['temperature']!,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WeatherScreen(
                    city: cities[index]['city']!,
                    temperature: cities[index]['temperature']!,
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
  final String temperature;

  const WeatherScreen({
    super.key,
    required this.city,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Weather in $city',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              'Temperature: $temperature',
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
