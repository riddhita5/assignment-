import 'package:flutter/material.dart';


class TeamGridScreen extends StatelessWidget {
  const TeamGridScreen({super.key});

  final List<Map<String, String>> teams = const [
    {
      "name": "CSK",
      "logo": "assets/csk.png",
    },
    {
      "name": "MI",
      "logo": "assets/mi.png",
    },
    {
      "name": "RCB",
      "logo": "assets/rcb.png",
    },
    {
      "name": "KKR",
      "logo": "assets/kkr.png",
    },
    {
      "name": "RR",
      "logo": "assets/rr.png",
    },
    {
      "name": "GT",
      "logo": "assets/gt.png",
    },
    {
      "name": "SRH",
      "logo": "assets/srh.png",
    },
    {
      "name": "DC",
      "logo": "assets/dc.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IPL Teams"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: teams.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TeamDetailsScreen(
                    teamName: teams[index]["name"]!,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    teams[index]["logo"]!,
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    teams[index]["name"]!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TeamDetailsScreen extends StatelessWidget {
  final String teamName;

  const TeamDetailsScreen({
    super.key,
    required this.teamName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(teamName),
      ),
      body: Center(
        child: Text(
          "$teamName Team Details\n\nComing Soon...",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}