import 'package:flutter/material.dart';
import 'ticket.dart';

class Data1 extends StatelessWidget {
  Data1({super.key});

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> ticketJson = {
      "movieName": "Pushpa 2",
      "seatNumber": "A10",
      "ticketPrice": 350
    };

    MovieTicket ticket = MovieTicket.fromJson(ticketJson);

    Map<String, dynamic> newJson = ticket.toJson();

    print("Movie: ${ticket.movieName}");
    print("Seat: ${ticket.seatNumber}");
    print("Price: ₹${ticket.ticketPrice}");

    print("Converted JSON:");
    print(newJson);

    return const Scaffold(
      body: Center(
        child: Text("Check the Debug Console"),
      ),
    );
  }
}
