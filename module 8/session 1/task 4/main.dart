import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: const MyApp(),
    ),
  );
}


class ProfileModel {
  String name;
  String email;

  ProfileModel({
    required this.name,
    required this.email,
  });
}


class ProfileProvider extends ChangeNotifier {
  ProfileModel profile = ProfileModel(
    name: "Riddhita",
    email: "riddhita@gmail.com",
  );

  void updateName(String name) {
    profile.name = name;
    notifyListeners();
  }

  void updateEmail(String email) {
    profile.email = email;
    notifyListeners();
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile App",
      home: const ProfileScreen(),
    );
  }
}


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),

      body: Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                Text(
                  profileProvider.profile.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  profileProvider.profile.email,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 30),

                TextField(
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    context
                        .read<ProfileProvider>()
                        .updateName(value);
                  },
                ),

                const SizedBox(height: 20),

                TextField(
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    context
                        .read<ProfileProvider>()
                        .updateEmail(value);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
