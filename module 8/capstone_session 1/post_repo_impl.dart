import '../../domain/entities/post.dart';
import '../../domain/repo/post_repo.dart';
import '../datasources/post_remote_datasource.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource dataSource;

  PostRepositoryImpl(this.dataSource);

  @override
  Future<List<Post>> getPosts() {
    return dataSource.fetchPosts();
  }
}