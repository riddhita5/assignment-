import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfileScreen(),
    );
  }
}


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String bio = 'Flutter Developer 🚀';

  Future<void> editBio() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditBioScreen(currentBio: bio),
      ),
    );

    if (result != null) {
      setState(() {
        bio = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              child: Icon(
                Icons.person,
                size: 70,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              bio,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: editBio,
              child: const Text('Edit Bio'),
            ),
          ],
        ),
      ),
    );
  }
}


class EditBioScreen extends StatefulWidget {
  final String currentBio;

  const EditBioScreen({
    super.key,
    required this.currentBio,
  });

  @override
  State<EditBioScreen> createState() => _EditBioScreenState();
}

class _EditBioScreenState extends State<EditBioScreen> {
  late TextEditingController bioController;

  @override
  void initState() {
    super.initState();

    bioController = TextEditingController(
      text: widget.currentBio,
    );
  }

  @override
  void dispose() {
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Bio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: bioController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Bio',
                hintText: 'Enter your bio',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final updatedBio = bioController.text;

                Navigator.pop(context, updatedBio);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
