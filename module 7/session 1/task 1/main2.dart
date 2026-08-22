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
      home: const CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Main Count: $count",
              style: const TextStyle(fontSize: 25),
            ),

            const SizedBox(height: 30),

            SecondCounter(
              count: count,
              onIncrement: increment,
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SecondCounter extends StatelessWidget {
  final int count;
  final VoidCallback onIncrement;

  const SecondCounter({
    super.key,
    required this.count,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Second Widget Count: $count",
          style: const TextStyle(fontSize: 25),
        ),

        const SizedBox(height: 10),

        ElevatedButton(
          onPressed: onIncrement,
          child: const Text("Increment"),
        ),
      ],
    );
  }
}
