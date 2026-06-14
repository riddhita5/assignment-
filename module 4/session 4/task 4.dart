import 'package:flutter/material.dart';

class TeamGridScreen2 extends StatelessWidget {
  const TeamGridScreen2({super.key});

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
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: teams.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(teams[index]["name"]!),

            // Swipe from left to right
            direction: DismissDirection.startToEnd,

            // Background shown while swiping
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.bookmark_add,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Add to Watchlist",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Prevent card from disappearing
            confirmDismiss: (direction) async {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Added to Watchlist"),
                  duration: Duration(seconds: 2),
                ),
              );

              return false;
            },

            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeamDetailsScreen2(
                      teamName: teams[index]["name"]!,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      teams[index]["logo"]!,
                      height: 80,
                      width: 80,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 12),
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
            ),
          );
        },
      ),
    );
  }
}

class TeamDetailsScreen2 extends StatelessWidget {
  final String teamName;

  const TeamDetailsScreen2({
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "$teamName Team Details\n\nComing Soon...",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}