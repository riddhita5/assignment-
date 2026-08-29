import 'package:get_it/get_it.dart';

import '../data/datasources/post_remote_datasource.dart';
import '../data/repositories/post_repo_impl.dart';
import '../domain/repo/post_repo.dart';
import '../domain/usecases/getposts.dart';
import '../presentation/bloc/post_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Data Source
  getIt.registerLazySingleton<PostRemoteDataSource>(
        () => PostRemoteDataSource(),
  );

  // Repository
  getIt.registerLazySingleton<PostRepository>(
        () => PostRepositoryImpl(
      getIt<PostRemoteDataSource>(),
    ),
  );

  // Use Case
  getIt.registerLazySingleton<GetPosts>(
        () => GetPosts(
      getIt<PostRepository>(),
    ),
  );

  // Bloc
  getIt.registerFactory<PostBloc>(
        () => PostBloc(
      getIt<GetPosts>(),
    ),
  );
}