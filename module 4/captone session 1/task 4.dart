import 'package:flutter/material.dart';

class HomePage4 extends StatefulWidget {
const HomePage4({super.key});

@override
State<HomePage4> createState() => _HomePage4State();
}

class _HomePage4State extends State<HomePage4> {
int selectedIndex = 0;

final List<Map<String, dynamic>> trendingServices = [
{
"name": "Food Delivery",
"icon": Icons.delivery_dining,
"description":
"Order delicious meals from your favourite restaurants.",
},
{
"name": "Movie Tickets",
"icon": Icons.movie,
"description":
"Book tickets for the latest movies and shows.",
},
{
"name": "Mobile Recharge",
"icon": Icons.phone_android,
"description":
"Recharge your prepaid mobile number instantly.",
},
{
"name": "Train Booking",
"icon": Icons.train,
"description":
"Reserve train tickets with ease.",
},
{
"name": "IPL Fantasy",
"icon": Icons.sports_cricket,
"description":
"Create your fantasy team and compete with others.",
},
];

final List<Map<String, String>> categories = [
{
"name": "Food",
"image":
"https://images.unsplash.com/photo-1504674900247-0877df9cc836",
"description":
"Discover restaurants and food delivery services.",
},
{
"name": "Travel",
"image":
"https://images.unsplash.com/photo-1488646953014-85cb44e25828",
"description":
"Book flights, hotels, and plan your trips.",
},
{
"name": "Shopping",
"image":
"https://images.unsplash.com/photo-1512436991641-6745cdb1723f",
"description":
"Explore the latest products and deals.",
},
{
"name": "Entertainment",
"image":
"https://images.unsplash.com/photo-1489599849927-2ee91cede3ba",
"description":
"Enjoy movies, events, and live experiences.",
},
{
"name": "Payments",
"image":
"https://images.unsplash.com/photo-1556740749-887f6717d7e4",
"description":
"Pay bills and transfer money securely.",
},
{
"name": "Sports",
"image":
"https://images.unsplash.com/photo-1540747913346-19e32dc3e97e",
"description":
"Stay updated with sports and fantasy leagues.",
},
];

@override
Widget build(BuildContext context) {
Widget body;

// Home Tab
if (selectedIndex == 0) {
body = ListView.builder(
itemCount: trendingServices.length,
itemBuilder: (context, index) {
final service = trendingServices[index];

return Card(
margin: const EdgeInsets.symmetric(
horizontal: 12,
vertical: 6,
),
child: ListTile(
leading: Icon(
service["icon"],
color: Colors.blue,
),
title: Text(service["name"]),
trailing: const Icon(Icons.arrow_forward_ios),

// Navigate on tap
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => DetailsScreen(
title: service["name"],
description: service["description"],
),
),
);
},
),
);
},
);
}

// Explore Tab
else if (selectedIndex == 1) {
body = GridView.builder(
padding: const EdgeInsets.all(12),
itemCount: categories.length,
gridDelegate:
const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
crossAxisSpacing: 12,
mainAxisSpacing: 12,
childAspectRatio: 0.9,
),
itemBuilder: (context, index) {
final category = categories[index];

return InkWell(
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => DetailsScreen(
title: category["name"]!,
description: category["description"]!,
),
),
);
},
child: Card(
elevation: 4,
clipBehavior: Clip.antiAlias,
child: Column(
children: [
Expanded(
child: Image.network(
category["image"]!,
width: double.infinity,
fit: BoxFit.cover,
),
),
Padding(
padding: const EdgeInsets.all(10),
child: Text(
category["name"]!,
style: const TextStyle(
fontSize: 16,
fontWeight: FontWeight.bold,
),
),
),
],
),
),
);
},
);
}

// Profile Tab
else {
body = const Center(
child: Text(
"Profile Screen",
style: TextStyle(fontSize: 24),
),
);
}

return Scaffold(
appBar: AppBar(
title: const Text("ServiceHub"),
centerTitle: true,
),
body: body,
bottomNavigationBar: BottomNavigationBar(
currentIndex: selectedIndex,
onTap: (index) {
setState(() {
selectedIndex = index;
});
},
items: const [
BottomNavigationBarItem(
icon: Icon(Icons.home),
label: "Home",
),
BottomNavigationBarItem(
icon: Icon(Icons.explore),
label: "Explore",
),
BottomNavigationBarItem(
icon: Icon(Icons.person),
label: "Profile",
),
],
),
);
}
}

// Details Screen
class DetailsScreen extends StatelessWidget {
final String title;
final String description;

const DetailsScreen({
super.key,
required this.title,
required this.description,
});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text(title),
),
body: Padding(
padding: const EdgeInsets.all(20),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
title,
style: const TextStyle(
fontSize: 28,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 20),

Text(
description,
style: const TextStyle(
fontSize: 18,
),
),
],
),
),
);
}
}