import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ErrorHandlingScreen extends StatefulWidget {
  const ErrorHandlingScreen({super.key});

  @override
  State<ErrorHandlingScreen> createState() => _ErrorHandlingScreenState();
}

class _ErrorHandlingScreenState extends State<ErrorHandlingScreen> {
  bool _isLoading = false;

  Future<void> _simulateError() async {
    setState(() => _isLoading = true);

    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/invalid-endpoint');

      final response = await http.post(
        url,
        body: jsonEncode({'incomplete': 'data'}),
      ).timeout(const Duration(seconds: 5));

      if (mounted) {
        if (response.statusCode >= 400) {
          _showError("Server returned error: ${response.statusCode}");
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Request Success (unexpectedly)")),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        _showError("An unexpected error occurred: $e");
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 5: Error Handling')),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
          onPressed: _simulateError,
          child: const Text('Simulate Incomplete POST Request'),
        ),
      ),
    );
  }
}
