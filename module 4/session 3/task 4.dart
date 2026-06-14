import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  ChatListScreen({super.key});

  final List<Map<String, String>> chats = [
    {
      "sender": "John",
      "message": "Hey, how are you?",
    },
    {
      "sender": "Emma",
      "message": "Let's meet tomorrow.",
    },
    {
      "sender": "David",
      "message": "Did you complete the assignment?",
    },
    {
      "sender": "Sophia",
      "message": "Call me when you're free.",
    },
    {
      "sender": "Michael",
      "message": "See you soon!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
      ),
      body: ListView.separated(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                chats[index]["sender"]![0],
              ),
            ),
            title: Text(
              chats[index]["sender"]!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              chats[index]["message"]!,
            ),
            trailing: const Icon(Icons.chevron_right),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.grey,
            thickness: 0.5,
            indent: 16,
            endIndent: 16,
          );
        },
      ),
    );
  }
}