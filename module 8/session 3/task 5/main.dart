import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Movie
{
  final String name;
  final String language;

  Movie({
    required this.name,
    required this.language,
  });
}

abstract class BookingEvent {}

class SelectMovie extends BookingEvent {
  final Movie movie;

  SelectMovie(this.movie);
}

abstract class BookingState {}

class BookingInitial extends BookingState {}

class MovieSelected extends BookingState {
  final Movie movie;

  MovieSelected(this.movie);
}


class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {

    on<SelectMovie>((event, emit) {

      emit(
        MovieSelected(event.movie),
      );

    });
  }
}

void main() {
  runApp(
    BlocProvider(
      create: (context) => BookingBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookMyShow',
      home: const MovieScreen(),
    );
  }
}

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final movie = Movie(
      name: 'Avengers: Endgame',
      language: 'English',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BookMyShow',
        ),
      ),

      body: BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {

          if (state is BookingInitial) {
            return Center(
              child: ElevatedButton(
                onPressed: () {

                  context.read<BookingBloc>().add(
                    SelectMovie(movie),
                  );

                },
                child: const Text(
                  'Select Movie',
                ),
              ),
            );
          }

          if (state is MovieSelected) {
            return Center(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [

                  const Icon(
                    Icons.movie,
                    size: 60,
                  ),

                  const SizedBox(height: 20),

                  Text(
                    state.movie.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    state.movie.language,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Movie Selected Successfully!',
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
