import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'score_feed.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const IPLScoreApp());
}

class IPLScoreApp extends StatelessWidget {
  const IPLScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IPL Live Score (Task 5)',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const ScoreFeedScreen(),
    );
  }
}
