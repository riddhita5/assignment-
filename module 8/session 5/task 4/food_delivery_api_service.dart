class Restaurant {
  final String name;
  Restaurant({required this.name});
}

class FoodDeliveryApiService {
  Future<List<Restaurant>> fetchPopularRestaurants() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Restaurant(name: "Pizza Hut"),
      Restaurant(name: "Burger King"),
      Restaurant(name: "Subway"),
      Restaurant(name: "McDonald's"),
      Restaurant(name: "Domino's"),
    ];
  }
}
