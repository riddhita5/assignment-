import 'package:flutter/material.dart';

class ProductListScreen2 extends StatelessWidget {
  ProductListScreen2({super.key});

  final List<Map<String, dynamic>> products = [
    {
      "category": "Mobiles",
      "name": "iPhone 16",
      "price": 79999,
    },
    {
      "category": "Mobiles",
      "name": "Samsung Galaxy S25",
      "price": 69999,
    },
    {
      "category": "Laptops",
      "name": "MacBook Air M4",
      "price": 99999,
    },
    {
      "category": "Laptops",
      "name": "HP Pavilion",
      "price": 65999,
    },
    {
      "category": "Accessories",
      "name": "Boat Headphones",
      "price": 1999,
    },
    {
      "category": "Accessories",
      "name": "Logitech Mouse",
      "price": 999,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flipkart Products"),
      ),
      body: ListView.separated(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              if (index == 0 ||
                  products[index]["category"] !=
                      products[index - 1]["category"])
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  color: Colors.grey.shade300,
                  child: Text(
                    products[index]["category"],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: ListTile(
                  title: Text(products[index]["name"]),
                  subtitle: Text(
                    "₹${products[index]["price"]}",
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {

          if (products[index]["category"] !=
              products[index + 1]["category"]) {
            return const Divider(
              thickness: 4,
            );
          }

          return const Divider(
            thickness: 1,
          );
        },
      ),
    );
  }
}