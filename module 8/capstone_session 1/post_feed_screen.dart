import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/service_locator.dart';
import '../bloc/post_bloc.dart';
import '../bloc/post_event.dart';
import '../bloc/post_state.dart';

class PostFeedScreen extends StatelessWidget {
  const PostFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PostBloc>()..add(FetchPosts()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('InstaFeedClone'),
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            // Loading
            if (state is PostLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // Loaded
            if (state is PostLoaded) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];

                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${post.id}'),
                      ),
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    ),
                  );
                },
              );
            }

            // Error
            if (state is PostError) {
              return Center(
                child: Text(
                  'Error: ${state.message}',
                ),
              );
            }

            return const Center(
              child: Text('No posts available'),
            );
          },
        ),
      ),
    );
  }
}