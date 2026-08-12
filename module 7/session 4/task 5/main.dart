import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'add_movie.dart';
import 'login.dart';
import 'movie_list.dart';
import 'register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Task5App());
}

class Task5App extends StatelessWidget {
  const Task5App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real-Time Movie Tracker (Task 5)',
      theme: ThemeData(
        primarySwatch: Colors.green, // Task 3 (Red) અને Task 4 (Blue) થી અલગ
        useMaterial3: true,
      ),
      home: const AuthWrapper(),
      routes: {
        '/add': (context) => const AddMovieScreen(),
        '/list': (context) => const MovieListScreen(),
        '/register': (context) => const RegisterPage(),
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
