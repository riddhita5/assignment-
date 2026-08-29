import '../../domain/entities/post.dart';

class PostRemoteDataSource {
  Future<List<Post>> fetchPosts() async {
    try {
      // Simulating API call
      await Future.delayed(
        const Duration(seconds: 2),
      );

      return List.generate(
        20,
            (index) => Post(
          id: index + 1,
          title: 'Post ${index + 1}',
          body: 'This is Instagram post ${index + 1}',
        ),
      );
    } catch (e) {
      throw Exception('Failed to fetch posts');
    }
  }
}