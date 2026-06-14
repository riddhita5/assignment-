import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Product Details"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Description"),
              Tab(text: "Reviews"),
              Tab(text: "Q&A"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Description Tab
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "This is the product description. Here you can display product specifications, features, and other details.",
                style: TextStyle(fontSize: 16),
              ),
            ),

            // Reviews Tab
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Customer reviews will be displayed here.",
                style: TextStyle(fontSize: 16),
              ),
            ),

            // Q&A Tab
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Questions and answers related to the product will appear here.",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}