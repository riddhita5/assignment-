import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants (Task 2)'),
        backgroundColor: Colors.blueAccent,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('restaurants').snapshots(),
        builder: (context, snapshot) {
          // 1. Error Handling: જો સ્ટ્રીમમાં કોઈ ભૂલ આવે તો એરર મેસેજ બતાવવો
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 60),
                  const SizedBox(height: 16),
                  Text(
                    'ભૂલ આવી છે: ${snapshot.error}',
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          // 2. Loading State: જ્યાં સુધી ડેટા લોડ ન થાય ત્યાં સુધી Spinner બતાવવો
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.blueAccent),
                  SizedBox(height: 16),
                  Text('ડેટા લોડ થઈ રહ્યો છે, મહેરબાની કરીને રાહ જુઓ...'),
                ],
              ),
            );
          }

          // ડેટા મળી જાય પછી લિસ્ટ બતાવવું
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('કોઈ રેસ્ટોરન્ટ મળી નથી.'));
          }

          final restaurants = snapshot.data!.docs;

          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final data = restaurants[index].data() as Map<String, dynamic>;
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.restaurant)),
                  title: Text(data['name'] ?? 'Unnamed'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
