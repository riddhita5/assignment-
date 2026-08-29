import 'package:flutter_bloc/flutter_bloc.dart';
import 'restaurant_event.dart';
import 'restaurant_state.dart';
import 'services/food_delivery_api_service.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final FoodDeliveryApiService apiService;

  RestaurantBloc(this.apiService) : super(RestaurantInitial()) {
    on<FetchRestaurants>((event, emit) async {
      emit(RestaurantLoading());

      try {
        final restaurants = await apiService.fetchPopularRestaurants();

        emit(RestaurantLoaded(restaurants));
      } catch (e) {
        emit(RestaurantError(e.toString()));
      }
    });
  }
}