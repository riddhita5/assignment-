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
      home: const TrendingHashtagsScreen(),
    );
  }
}

class TrendingHashtagsScreen extends StatefulWidget {
  const TrendingHashtagsScreen({super.key});

  @override
  State<TrendingHashtagsScreen> createState() =>
      _TrendingHashtagsScreenState();
}

class _TrendingHashtagsScreenState
    extends State<TrendingHashtagsScreen> {

  List<String> trendingHashtags = [];

  @override
  void initState() {
    super.initState();

    final List<String> hashtags = [
      '#Flutter',
      '#Dart',
      '#Coding',
      '#Programming',
      '#MobileDevelopment',
      '#Tech',
      '#Developer',
    ];

    trendingHashtags = hashtags;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Hashtags'),
      ),
      body: ListView.builder(
        itemCount: trendingHashtags.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.trending_up),
            title: Text(
              trendingHashtags[index],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }
}
