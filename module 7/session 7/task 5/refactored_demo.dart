import 'dart:io';
import 'package:flutter/material.dart';
import 'image_utils.dart'; // ઈમેજ પિક કરવા માટેની યુટિલિટી ફાઈલ

class RefactoredDemo extends StatefulWidget {
  const RefactoredDemo({super.key});

  @override
  State<RefactoredDemo> createState() => _RefactoredDemoState();
}

class _RefactoredDemoState extends State<RefactoredDemo> {
  File? _image;

  // UI માંથી ડાયરેક્ટ ImageUtils ના ફંક્શન કોલ કરવા
  Future<void> _handleCameraPick() async {
    final File? pickedFile = await ImageUtils.pickImageFromCamera(context);
    if (pickedFile != null) {
      setState(() => _image = pickedFile);
    }
  }

  Future<void> _handleGalleryPick() async {
    final File? pickedFile = await ImageUtils.pickImageFromGallery(context);
    if (pickedFile != null) {
      setState(() => _image = pickedFile);
    }
  }

  void _showPickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                _handleCameraPick();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _handleGalleryPick();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refactored Logic (Task 5)'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.deepPurple.withOpacity(0.1),
              backgroundImage: _image != null ? FileImage(_image!) : null,
              child: _image == null
                  ? const Icon(Icons.image_outlined, size: 80, color: Colors.deepPurple)
                  : null,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _showPickerOptions,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple, foregroundColor: Colors.white),
              child: const Text('Change Profile Photo'),
            ),
          ],
        ),
      ),
    );
  }
}
