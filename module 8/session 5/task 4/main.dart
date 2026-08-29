import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_7/restaurant_bloc.dart';
import 'package:module_7/screens/homescreen.dart';
import 'package:module_7/services/services_locator.dart';


void main() {
  setupDependencies();

  runApp(
    BlocProvider(
      create: (_) => getIt<RestaurantBloc>(),
      child: const MyApp(),
    ),
  );
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
