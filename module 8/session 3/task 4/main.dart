import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => RestaurantBloc()
        ..add(FetchRestaurants()),
      child: const MyApp(),
    ),
  );
}

class Restaurant {
  final String name;
  final String cuisine;

  Restaurant({
    required this.name,
    required this.cuisine,
  });
}

abstract class RestaurantEvent {}

class FetchRestaurants extends RestaurantEvent 
{
  
}

abstract class RestaurantState 
{
  
}

class RestaurantInitial extends RestaurantState 
{
  
}

class RestaurantLoading extends RestaurantState 
{
  
}

class RestaurantSuccess extends RestaurantState {
  final List<Restaurant> restaurants;

  RestaurantSuccess(this.restaurants);
}

class RestaurantError extends RestaurantState {
  final String message;

  RestaurantError(this.message);
}


class RestaurantBloc
    extends Bloc<RestaurantEvent, RestaurantState> {

  RestaurantBloc()
      : super(RestaurantInitial()) {

    on<FetchRestaurants>(_fetchRestaurants);
  }


  Future<void> _fetchRestaurants(
      FetchRestaurants event,
      Emitter<RestaurantState> emit,
      ) async {

    emit(RestaurantLoading());

    try {
      await Future.delayed(
        const Duration(seconds: 2),
      );

      final restaurants = [
        Restaurant(
          name: 'Dominos',
          cuisine: 'Pizza',
        ),
        Restaurant(
          name: 'McDonalds',
          cuisine: 'Fast Food',
        ),
        Restaurant(
          name: 'Subway',
          cuisine: 'Sandwich',
        ),
        Restaurant(
          name: 'Burger King',
          cuisine: 'Burgers',
        ),
      ];

      emit(
        RestaurantSuccess(restaurants),
      );
    } catch (e) {
      emit(
        RestaurantError(
          'Failed to fetch restaurants',
        ),
      );
    }
  }
  
  @override
  void onTransition(
      Transition<RestaurantEvent, RestaurantState> transition,
      ) {
    super.onTransition(transition);

    print('==============================');
    print('RestaurantBloc Transition');
    print('Event: ${transition.event}');
    print('Current State: ${transition.currentState}');
    print('Next State: ${transition.nextState}');
    print('==============================');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zomato Restaurant App',
      home: const RestaurantScreen(),
    );
  }
}

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurants',
        ),
      ),

      body: BlocBuilder<
          RestaurantBloc,
          RestaurantState>(
        builder: (context, state) {
          
          if (state is RestaurantLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          
          if (state is RestaurantSuccess) {
            return ListView.builder(
              itemCount: state.restaurants.length,
              itemBuilder: (context, index) {

                final restaurant =
                state.restaurants[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const Icon(
                      Icons.restaurant,
                      size: 35,
                    ),

                    title: Text(
                      restaurant.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      restaurant.cuisine,
                    ),
                  ),
                );
              },
            );
          }


          if (state is RestaurantError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
            );
          }

          return const Center(
            child: Text(
              'Loading restaurants...',
            ),
          );
        },
      ),
    );
  }
}
