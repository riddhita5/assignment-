import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => PlaylistBloc()..add(FetchSongs()),
      child: const MyApp(),
    ),
  );
}


abstract class PlaylistEvent {}

class FetchSongs extends PlaylistEvent {}

abstract class PlaylistState {}

class PlaylistInitial extends PlaylistState {}

class PlaylistLoading extends PlaylistState {}

class PlaylistSuccess extends PlaylistState {
  final List<String> songs;

  PlaylistSuccess(this.songs);
}

class PlaylistError extends PlaylistState {
  final String message;

  PlaylistError(this.message);
}


class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  PlaylistBloc() : super(PlaylistInitial()) {
    on<FetchSongs>(_fetchSongs);
  }

  Future<void> _fetchSongs(
      FetchSongs event,
      Emitter<PlaylistState> emit,
      ) async {
    emit(PlaylistLoading());

    try {
      await Future.delayed(
        const Duration(seconds: 2),
      );

      final List<String> songs = [
        'Perfect',
        'Believer',
        'Shape of You',
        'Hymn for the Weekend',
        'Love Me Like You Do',
      ];

      emit(PlaylistSuccess(songs));
    } catch (e) {
      emit(
        PlaylistError(
          'Failed to fetch songs',
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
      title: 'Playlist App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlaylistScreen(),
    );
  }
}


class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Playlist'),
      ),

      body: BlocBuilder<PlaylistBloc, PlaylistState>(
        builder: (context, state) {

          if (state is PlaylistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is PlaylistSuccess) {
            return ListView.builder(
              itemCount: state.songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(
                    Icons.music_note,
                  ),
                  title: Text(
                    state.songs[index],
                  ),
                );
              },
            );
          }

          if (state is PlaylistError) {
            return Center(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error,
                    size: 50,
                    color: Colors.red,
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
                          .read<PlaylistBloc>()
                          .add(FetchSongs());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return const Center(
            child: Text(
              'No songs available',
            ),
          );
        },
      ),
    );
  }
}
