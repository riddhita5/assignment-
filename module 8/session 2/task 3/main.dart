import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: const CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

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
            // Counter value
            BlocBuilder<CounterCubit, int>(
              builder: (context, count) {
                return Text(
                  "$count",
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
              child: const Text("Increment"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().decrement();
              },
              child: const Text("Decrement"),
            ),
          ],
        ),
      ),
    );
  }
}
