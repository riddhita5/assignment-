import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUploadScreen extends StatefulWidget {
  const ProfileUploadScreen({super.key});

  @override
  State<ProfileUploadScreen> createState() => _ProfileUploadScreenState();
}

class _ProfileUploadScreenState extends State<ProfileUploadScreen> {
  File? _image;
  String? _uploadStatus;
  final ImagePicker _picker = ImagePicker();

  // 1. Image Pick કરવાની અને Upload કરવાની મુખ્ય ફંક્શન
  Future<void> uploadProfilePicture() async {
    try {
      // ગેલેરીમાંથી ઈમેજ સિલેક્ટ કરવી
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50, // સાઈઝ ઘટાડવા માટે
      );

      if (pickedFile == null) return;

      setState(() {
        _image = File(pickedFile.path);
        _uploadStatus = 'Uploading...';
      });

      // Firebase Storage માં પાથ સેટ કરવો (profile_pics ફોલ્ડર)
      String fileName = 'profile_${DateTime.now().millisecondsSinceEpoch}.jpg';
      Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_pics')
          .child(fileName);

      // ફાઈલ અપલોડ કરવી
      UploadTask uploadTask = storageRef.putFile(_image!);
      
      // અપલોડ પૂર્ણ થાય તેની રાહ જોવી
      TaskSnapshot snapshot = await uploadTask;
      
      // ડાઉનલોડ URL મેળવવી
      String downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        _uploadStatus = 'Upload Success!';
        print('Download URL: $downloadUrl');
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile picture uploaded successfully!')),
      );

    } catch (e) {
      setState(() {
        _uploadStatus = 'Upload Failed';
      });
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Upload (Task 1)'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ઈમેજ પ્રિવ્યુ
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[300],
              backgroundImage: _image != null ? FileImage(_image!) : null,
              child: _image == null
                  ? const Icon(Icons.person, size: 60, color: Colors.white)
                  : null,
            ),
            const SizedBox(height: 20),
            
            // સ્ટેટસ મેસેજ
            if (_uploadStatus != null)
              Text(
                _uploadStatus!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _uploadStatus == 'Upload Success!' ? Colors.green : Colors.orange,
                ),
              ),
            
            const SizedBox(height: 30),
            
            // અપલોડ બટન
            ElevatedButton.icon(
              onPressed: uploadProfilePicture,
              icon: const Icon(Icons.cloud_upload),
              label: const Text('Select & Upload Image'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
