import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => CartBloc(),
      child: const MyApp(),
    ),
  );
}

class Product {
  final int id;
  final String name;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.price,
  });
}

abstract class CartEvent {}

class AddItem extends CartEvent {
  final Product product;

  AddItem(this.product);
}

class RemoveItem extends CartEvent {
  final Product product;

  RemoveItem(this.product);
}

class CartState {
  final List<Product> items;

  CartState({required this.items});
}

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(items: [])) {

    on<AddItem>((event, emit) {
      final updatedItems = List<Product>.from(state.items);

      updatedItems.add(event.product);

      emit(
        CartState(
          items: updatedItems,
        ),
      );
    });

    on<RemoveItem>((event, emit) {
      final updatedItems = List<Product>.from(state.items);

      updatedItems.remove(event.product);

      emit(
        CartState(
          items: updatedItems,
        ),
      );
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flipkart Cart',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Product> products = const [];

  @override
  Widget build(BuildContext context) {
    final products = [
      Product(
        id: 1,
        name: 'iPhone 15',
        price: 69999,
      ),
      Product(
        id: 2,
        name: 'Samsung Galaxy S24',
        price: 59999,
      ),
      Product(
        id: 3,
        name: 'Boat Headphones',
        price: 1999,
      ),
      Product(
        id: 4,
        name: 'Smart Watch',
        price: 2999,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flipkart'),
        actions: [

          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const CartScreen(),
                        ),
                      );
                    },
                  ),

                  if (state.items.isNotEmpty)
                    Positioned(
                      right: 5,
                      top: 5,
                      child: CircleAvatar(
                        radius: 9,
                        backgroundColor: Colors.red,
                        child: Text(
                          '${state.items.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(
                Icons.shopping_bag,
                size: 40,
              ),

              title: Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(
                '₹${product.price}',
              ),

              trailing: ElevatedButton(
                onPressed: () {
                  context.read<CartBloc>().add(
                    AddItem(product),
                  );
                },
                child: const Text(
                  'Add',
                ),
              ),
            ),
          );
        },
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
        title: const Text('My Cart'),
      ),

      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {

          if (state.items.isEmpty) {
            return const Center(
              child: Text(
                'Cart is Empty',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              final product = state.items[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: const Icon(
                    Icons.shopping_bag,
                  ),

                  title: Text(
                    product.name,
                  ),

                  subtitle: Text(
                    '₹${product.price}',
                  ),

                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),

                    onPressed: () {

                      context.read<CartBloc>().add(
                        RemoveItem(product),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
