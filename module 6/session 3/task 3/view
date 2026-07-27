import 'package:flutter/material.dart';
import 'product.dart';

class view extends StatelessWidget {
  view({super.key});

  @override
  Widget build(BuildContext context) {

    // Sample Flipkart Products JSON
    List<dynamic> productJson = [
      {
        "name": "Samsung Galaxy S24",
        "price": 65000
      },
      {
        "name": "Boat Headphones",
        "price": 1999
      },
      {
        "name": "HP Laptop",
        "price": 55000
      }
    ];

    // Convert JSON to List<Product>
    List<Product> products = getProducts(productJson);

    // Print in Debug Console
    for (var product in products) {
      print("Product: ${product.name}");
      print("Price: ₹${product.price}");
      print("----------------");
    }

    return const Scaffold(
      body: Center(
        child: Text("Check the Debug Console"),
      ),
    );
  }
}
