import 'package:flutter/material.dart';
import 'details_screen.dart';

class CategoryGridItem extends StatelessWidget {
  final String name;
  final String image;
  final String description;

  const CategoryGridItem({
    super.key,
    required this.name,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsScreen(
              title: name,
              description: description,
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
                image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                name,
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
  }
}
