import 'package:flutter/material.dart';
import 'dbhelper.dart';

class RestaurantScreen3 extends StatefulWidget {
  const RestaurantScreen3({super.key});

  @override
  State<RestaurantScreen3> createState() => _RestaurantScreen3State();
}

class _RestaurantScreen3State extends State<RestaurantScreen3> {
  List<Map<String, dynamic>> _restaurants = [];

  @override
  void initState() {
    super.initState();
    _refreshRestaurants();
  }

  Future<void> _refreshRestaurants() async {
    final data = await DbHelper.instance.queryAllRows();
    setState(() {
      _restaurants = data;
    });
  }

  void _showEditDialog(Map<String, dynamic> restaurant) {
    final nameController = TextEditingController(text: restaurant[DbHelper.columnName]);
    final cuisineController = TextEditingController(text: restaurant[DbHelper.columnCuisine]);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Restaurant"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: "Name")),
            TextField(controller: cuisineController, decoration: const InputDecoration(labelText: "Cuisine")),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await DbHelper.instance.updatedata({
                DbHelper.columnId: restaurant[DbHelper.columnId],
                DbHelper.columnName: nameController.text,
                DbHelper.columnCuisine: cuisineController.text,
              });
              Navigator.pop(context);
              _refreshRestaurants();
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text("Restaurant Manager", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.orange.shade800,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: _restaurants.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.restaurant_menu, size: 80, color: Colors.grey.shade300),
                  const SizedBox(height: 16),
                  const Text("No restaurants found", style: TextStyle(color: Colors.grey, fontSize: 18)),
                  const SizedBox(height: 8),
                  const Text("Tap + to add a new one", style: TextStyle(color: Colors.grey)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = _restaurants[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 2,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange.shade100,
                      child: const Icon(Icons.restaurant, color: Colors.orange),
                    ),
                    title: Text(
                      restaurant[DbHelper.columnName],
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      restaurant[DbHelper.columnCuisine],
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit_outlined, color: Colors.blue),
                      onPressed: () => _showEditDialog(restaurant),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange.shade800,
        foregroundColor: Colors.white,
        onPressed: () async {
          await DbHelper.instance.insertdata({DbHelper.columnName: 'New Restro', DbHelper.columnCuisine: 'Indian'});
          _refreshRestaurants();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
