import '../entities/post.dart';
import '../repo/post_repo.dart';

class GetPosts {
  final PostRepository repository;

  GetPosts(this.repository);

  Future<List<Post>> call() {
    return repository.getPosts();
  }
}