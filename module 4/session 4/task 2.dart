import 'package:flutter/material.dart';

class FoodScreen1 extends StatelessWidget {
  FoodScreen1({super.key});

  final List<String> foodItems = [
    "Pizza",
    "Burger",
    "Dosa",
    "Pasta",
    "Sandwich",
    "Biryani",
    "Noodles",
    "Momos",
    "Pav Bhaji",
    "Ice Cream",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Menu"),
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${foodItems[index]} tapped"),
                ),
              );
            },

            onLongPress: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.favorite),
                        title: const Text("Add to Favourites"),
                        onTap: () {
                          Navigator.pop(context);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "${foodItems[index]} added to favourites",
                              ),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.share),
                        title: const Text("Share"),
                        onTap: () {
                          Navigator.pop(context);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Sharing ${foodItems[index]}",
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },

            child: ListTile(
              leading: const Icon(Icons.fastfood),
              title: Text(foodItems[index]),
            ),
          );
        },
      ),
    );
  }
}