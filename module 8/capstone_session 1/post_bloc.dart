import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/getposts.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPosts getPosts;

  PostBloc(this.getPosts) : super(PostInitial()) {
    on<FetchPosts>(_fetchPosts);
  }

  Future<void> _fetchPosts(
      FetchPosts event,
      Emitter<PostState> emit,
      ) async {
    emit(PostLoading());

    try {
      final posts = await getPosts();

      emit(PostLoaded(posts));
    } catch (e) {
      emit(
        PostError('Unable to load posts. Please try again.'),
      );
    }
  }
}