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
      home: const HomeScreen(),
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String favoriteTeam = 'Mumbai Indians';

  Future<void> changeTeam() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SelectTeamScreen(),
      ),
    );

    if (result != null) {
      setState(() {
        favoriteTeam = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My IPL Team'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'My Favorite IPL Team',
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              favoriteTeam,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: changeTeam,
              child: const Text('Change Team'),
            ),
          ],
        ),
      ),
    );
  }
}


class SelectTeamScreen extends StatelessWidget {
  const SelectTeamScreen({super.key});

  final List<String> teams = const [
    'Mumbai Indians',
    'Chennai Super Kings',
    'Royal Challengers Bengaluru',
    'Kolkata Knight Riders',
    'Rajasthan Royals',
    'Delhi Capitals',
    'Punjab Kings',
    'Sunrisers Hyderabad',
    'Lucknow Super Giants',
    'Gujarat Titans',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select IPL Team'),
      ),
      body: ListView.builder(
        itemCount: teams.length,
        itemBuilder: (context, index) {
          final String selectedTeam = teams[index];

          return ListTile(
            leading: const Icon(Icons.sports_cricket),
            title: Text(
              selectedTeam,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {
              Navigator.pop(context, selectedTeam);
            },
          );
        },
      ),
    );
  }
}
