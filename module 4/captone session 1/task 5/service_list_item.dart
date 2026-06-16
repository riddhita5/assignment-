import 'package:flutter/material.dart';
import 'details_screen.dart';

class ServiceListItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final String description;

  const ServiceListItem({
    super.key,
    required this.icon,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blue,
        ),
        title: Text(name),
        trailing: const Icon(Icons.arrow_forward_ios),
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
      ),
    );
  }
}