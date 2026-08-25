import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => MovieListBloc()..add(FetchMovies()),
      child: const MyApp(),
    ),
  );
}

class Movie {
  final String title;

  Movie({required this.title});
}

abstract class MovieListEvent {}

class FetchMovies extends MovieListEvent {}

abstract class MovieListState {}

class MovieListInitial extends MovieListState {}

class MovieListLoading extends MovieListState {}

class MovieListSuccess extends MovieListState {
  final List<Movie> movies;

  MovieListSuccess(this.movies);
}

class MovieListError extends MovieListState {
  final String message;

  MovieListError(this.message);
}

class MovieListBloc
    extends Bloc<MovieListEvent, MovieListState> {

  MovieListBloc() : super(MovieListInitial()) {
    on<FetchMovies>(_fetchMovies);
  }

  Future<void> _fetchMovies(
      FetchMovies event,
      Emitter<MovieListState> emit,
      ) async {

    emit(MovieListLoading());

    try {
      await Future.delayed(
        const Duration(seconds: 3),
      );

      final movies = [
        Movie(title: 'Avengers: Endgame'),
        Movie(title: 'Spider-Man'),
        Movie(title: 'Iron Man'),
        Movie(title: 'Interstellar'),
        Movie(title: 'Inception'),
      ];

      emit(MovieListSuccess(movies));
    } catch (e) {
      emit(
        MovieListError(
          'Failed to fetch movies',
        ),
      );
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      home: const MovieListScreen(),
    );
  }
}

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),

      body: BlocBuilder<MovieListBloc, MovieListState>(
        builder: (context, state) {

          if (state is MovieListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is MovieListSuccess) {
            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {

                final movie = state.movies[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const Icon(
                      Icons.movie,
                      size: 35,
                    ),
                    title: Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            );
          }

          if (state is MovieListError) {
            return Center(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [

                  const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 50,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    state.message,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<MovieListBloc>()
                          .add(FetchMovies());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return const Center(
            child: Text(
              'No movies available',
            ),
          );
        },
      ),
    );
  }
}
