import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/service_locator.dart';
import 'presentation/bloc/post_bloc.dart';
import 'presentation/bloc/post_event.dart';
import 'presentation/bloc/post_state.dart';

void main() {
  setupDependencies();

  runApp(const InstaFeedClone());
}

class InstaFeedClone extends StatelessWidget {
  const InstaFeedClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => getIt<PostBloc>()..add(FetchPosts()),
        child: const PostFeedScreen(),
      ),
    );
  }
}

class PostFeedScreen extends StatelessWidget {
  const PostFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InstaFeedClone'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];

                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${post.id}'),
                  ),
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          }

          if (state is PostError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          }

          return const Center(
            child: Text('No posts available'),
          );
        },
      ),
    );
  }
}
