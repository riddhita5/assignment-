import 'package:assessment4/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
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
      home: const AddProductScreen(),
    );
  }
}

// Screen 1: Add products
class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  final List<String> availableProducts = const [
    'iPhone',
    'Laptop',
    'Headphones',
    'Smart Watch',
    'Keyboard',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: availableProducts.length,
        itemBuilder: (context, index) {
          final product = availableProducts[index];

          return ListTile(
            title: Text(product),
            trailing: ElevatedButton(
              onPressed: () {
                context.read<CartProvider>().addProduct(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$product added to cart'),
                  ),
                );
              },
              child: const Text('Add'),
            ),
          );
        },
      ),
    );
  }
}

// Screen 2: View and remove products
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Rebuilds this screen whenever the cart changes
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: cart.products.isEmpty
          ? const Center(
        child: Text(
          'Cart is empty',
          style: TextStyle(fontSize: 20),
        ),
      )
          : ListView.builder(
        itemCount: cart.products.length,
        itemBuilder: (context, index) {
          final product = cart.products[index];

          return ListTile(
            title: Text(product),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                context.read<CartProvider>().removeProduct(product);
              },
            ),
          );
        },
      ),
    );
  }
}
