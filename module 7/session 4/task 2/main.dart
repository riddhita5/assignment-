import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Restaurant App',

theme: ThemeData(
primarySwatch: Colors.red,
scaffoldBackgroundColor: Colors.grey.shade100,
),

home: const RestaurantScreen(),
);
}
}

class RestaurantScreen extends StatelessWidget {
const RestaurantScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text(
'Restaurants',
style: TextStyle(
fontWeight: FontWeight.bold,
),
),
centerTitle: true,
),

body: StreamBuilder<QuerySnapshot>(
stream: FirebaseFirestore.instance
    .collection('Restaurants')
    .snapshots(),

builder: (context, snapshot) {

// Loading
if (snapshot.connectionState == ConnectionState.waiting) {
return const Center(
child: CircularProgressIndicator(),
);
}

// Error
if (snapshot.hasError) {
return Center(
child: Text(
'Error: ${snapshot.error}',
style: const TextStyle(
color: Colors.red,
),
),
);
}

// Empty collection
if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
return const Center(
child: Text(
'No restaurants found',
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),
);
}

// All Firestore documents
final restaurants = snapshot.data!.docs;

return ListView.builder(
padding: const EdgeInsets.all(10),

itemCount: restaurants.length,

itemBuilder: (context, index) {

// Current document
final restaurant = restaurants[index];

// Firestore fields
final String name = restaurant['name'];
final String cuisine = restaurant['cuisine'];

return Card(
margin: const EdgeInsets.only(bottom: 12),

elevation: 3,

shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(15),
),

child: ListTile(
contentPadding: const EdgeInsets.all(12),

leading: CircleAvatar(
radius: 30,
backgroundColor: Colors.red.shade100,

child: Icon(
Icons.restaurant,
color: Colors.red.shade700,
size: 30,
),
),

title: Text(
name,
style: const TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),

subtitle: Padding(
padding: const EdgeInsets.only(top: 5),

child: Text(
cuisine,
style: TextStyle(
fontSize: 14,
color: Colors.grey.shade700,
),
),
),

trailing: const Icon(
Icons.arrow_forward_ios,
size: 18,
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
