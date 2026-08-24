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
        child: BlocBuilder<CounterCubit, int>(
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
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            child: const Icon(Icons.remove),
          ),

          const SizedBox(width: 15),

          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
