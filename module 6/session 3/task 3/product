class Product {
  String name;
  int price;

  Product({
    required this.name,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json["name"],
      price: json["price"],
    );
  }
}

// Function to convert JSON array into List<Product>
List<Product> getProducts(List<dynamic> jsonData) {
  return jsonData.map((item) => Product.fromJson(item)).toList();
}
