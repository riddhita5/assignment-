import 'package:flutter/material.dart';

import 'core/service_locator.dart';
import 'presentation/screens/post_feed_screen.dart';

void main() {
  setupDependencies();

  runApp(const InstaFeedClone());
}

class InstaFeedClone extends StatelessWidget {
  const InstaFeedClone({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostFeedScreen(),
    );
  }
}
