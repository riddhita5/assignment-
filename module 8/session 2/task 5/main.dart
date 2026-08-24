import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_cubit.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ThemeCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDark) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,
          ),

          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

          home: const ThemeScreen(),
        );
      },
    );
  }
}

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme App"),
      ),

      body: Center(
        child: BlocBuilder<ThemeCubit, bool>(
          builder: (context, isDark) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isDark ? "Dark Mode" : "Light Mode",
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),

                const SizedBox(height: 20),

                Switch(
                  value: isDark,
                  onChanged: (value) {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
