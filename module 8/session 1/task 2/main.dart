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

class CartProvider extends ChangeNotifier {
  int cartCount = 0;

  void addItem() {
    cartCount++;
    notifyListeners();
  }

  void removeItem() {
    if (cartCount > 0) {
      cartCount--;
      notifyListeners();
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ShoppingScreen(),
    );
  }
}

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping"),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Cart: ${cart.cartCount}",
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              );
            },
          ),
        ],
      ),

      body: Center(
        child: Consumer<CartProvider>(
          builder: (context, cart, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Shopping Screen",
                  style: TextStyle(fontSize: 25),
                ),

                const SizedBox(height: 20),

                Text(
                  "Cart Items: ${cart.cartCount}",
                  style: const TextStyle(fontSize: 22),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: cart.addItem,
                  child: const Text("Add to Cart"),
                ),

                ElevatedButton(
                  onPressed: cart.removeItem,
                  child: const Text("Remove from Cart"),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                  child: const Text("Open Cart Screen"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Screen"),
      ),

      body: Center(
        child: Consumer<CartProvider>(
          builder: (context, cart, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Cart Screen",
                  style: TextStyle(fontSize: 25),
                ),

                const SizedBox(height: 20),

                Text(
                  "Cart Items: ${cart.cartCount}",
                  style: const TextStyle(fontSize: 22),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: cart.addItem,
                  child: const Text("Add Item"),
                ),

                ElevatedButton(
                  onPressed: cart.removeItem,
                  child: const Text("Remove Item"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
