import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HeaderPostScreen extends StatefulWidget {
  const HeaderPostScreen({super.key});

  @override
  State<HeaderPostScreen> createState() => _HeaderPostScreenState();
}

class _HeaderPostScreenState extends State<HeaderPostScreen> {
  Future<void> _sendWithHeaders() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final headers = {
      'Content-type': 'application/json; charset=UTF-8',
      'x-app-source': 'flutter-demo',
    };
    final body = jsonEncode({
      'title': 'Test Title',
      'body': 'Test Body',
      'userId': 1,
    });

    print("Request Headers: $headers");
    print("Request Payload: $body");

    final response = await http.post(url, headers: headers, body: body);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Status: ${response.statusCode}. Check console for logs.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 4: Custom Headers')),
      body: Center(
        child: ElevatedButton(
          onPressed: _sendWithHeaders,
          child: const Text('Send Request with Headers'),
        ),
      ),
    );
  }
}
