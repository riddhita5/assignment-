import 'package:flutter/material.dart';

class IPLTeamsScreen extends StatelessWidget {

  final List<String> teams = [
    "Chennai Super Kings",
    "Mumbai Indians",
    "Royal Challengers Bengaluru",
    "Kolkata Knight Riders",
    "Rajasthan Royals",
    "Sunrisers Hyderabad",
    "Delhi Capitals",
    "Punjab Kings",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trending IPL Teams"),
      ),

      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView.separated(
          itemCount: teams.length,

          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.sports_cricket),
                title: Text(teams[index]),
              ),
            );
          },

          separatorBuilder: (context, index) {
            return SizedBox(height: 12);
          },
        ),
      ),
    );
  }
}