import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  // રેન્ડમ નામ સાથે નવું રેસ્ટોરન્ટ ઉમેરવા માટેનું ફંક્શન
  Future<void> _addRandomRestaurant() async {
    final List<String> names = [
      'Gourmet Garden',
      'The Spicy Spoon',
      'Ocean Breeze',
      'Mountain Grill',
      'Urban Eats',
      'Golden Dragon',
      'Little Italy',
      'Royal Feast',
      'Healthy Bites',
      'The Rusty Anchor'
    ];
    final String randomName = names[Random().nextInt(names.length)] + ' #${Random().nextInt(100)}';

    try {
      await FirebaseFirestore.instance.collection('restaurants').add({
        'name': randomName,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error adding restaurant: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Restaurants (Task 3)'),
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('restaurants')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No restaurants found. Tap + to add one!'));
          }

          final restaurants = snapshot.data!.docs;

          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final data = restaurants[index].data() as Map<String, dynamic>;
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: const CircleAvatar(backgroundColor: Colors.green, child: Icon(Icons.restaurant, color: Colors.white)),
                  title: Text(data['name'] ?? 'Unnamed'),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRandomRestaurant,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
