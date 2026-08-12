import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Task 3 ના UI ઈમ્પોર્ટ કરી રહ્યા છીએ કારણ કે Task 4 એ તેમાં જ અપડેટ છે
import '../task 3/add_movie.dart';
import '../task 3/login.dart';
import '../task 3/movie_list.dart';
import '../task 3/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Task4App());
}

class Task4App extends StatelessWidget {
  const Task4App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Tracker - Task 4',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Task 3 થી અલગ દેખાવા માટે કલર બદલ્યો
        useMaterial3: true,
      ),
      home: const AuthWrapper(),
      routes: {
        '/add': (context) => const AddMovieScreen(),
        '/list': (context) => const MovieListScreen(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasData) {
          return const MovieListScreen();
        }
        return const LoginScreen();
      },
    );
  }
}
