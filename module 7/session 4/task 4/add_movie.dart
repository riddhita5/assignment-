import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({super.key});

  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  int _rating = 3;
  bool _isSaving = false;

  Future<void> _saveMovie() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);
    try {
      await FirebaseFirestore.instance.collection('Movies').add({
        'title': _titleController.text.trim(),
        'genre': _genreController.text.trim(),
        'rating': _rating,
        'views': 0, // Task 4 માં views 0 થી શરૂ થાય છે
        'createdAt': FieldValue.serverTimestamp(),
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Movie added successfully!')));
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Movie (Task 4)')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (v) => v!.isEmpty ? 'Enter title' : null,
              ),
              TextFormField(
                controller: _genreController,
                decoration: const InputDecoration(labelText: 'Genre'),
                validator: (v) => v!.isEmpty ? 'Enter genre' : null,
              ),
              const SizedBox(height: 20),
              const Text('Rating:'),
              Row(
                children: List.generate(5, (index) => IconButton(
                  icon: Icon(index < _rating ? Icons.star : Icons.star_border, color: Colors.amber),
                  onPressed: () => setState(() => _rating = index + 1),
                )),
              ),
              ElevatedButton(
                onPressed: _isSaving ? null : _saveMovie,
                child: _isSaving ? const CircularProgressIndicator() : const Text('Save Movie'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
