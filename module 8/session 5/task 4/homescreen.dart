import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../restaurant_bloc.dart';
import '../restaurant_event.dart';
import '../restaurant_state.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    context.read<RestaurantBloc>().add(
      FetchRestaurants(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurants"),
      ),
      body: BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (context, state) {
          if (state is RestaurantLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is RestaurantLoaded) {
            return ListView.builder(
              itemCount: state.restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = state.restaurants[index];

                return ListTile(
                  title: Text(restaurant.name),
                );
              },
            );
          }

          if (state is RestaurantError) {
            return Center(
              child: Text(state.message),
            );
          }

          return const Center(
            child: Text("No restaurants found"),
          );
        },
      ),
    );
  }
}