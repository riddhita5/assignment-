import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:module_7/services/logger_service.dart';


final getIt = GetIt.instance;

void main() {

  getIt.registerLazySingleton<LoggerService>(
        () => LoggerService(),
  );

  final logger = getIt<LoggerService>();

  logger.log('App started');

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
          title: const Text('GetIt Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {

              final logger =
              getIt<LoggerService>();

              logger.log(
                'Button clicked',
              );
            },
            child: const Text(
              'Print Log',
            ),
          ),
        ),
      ),
    );
  }
}
