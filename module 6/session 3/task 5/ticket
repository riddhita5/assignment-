class MovieTicket {
  String movieName;
  String seatNumber;
  int ticketPrice;

  MovieTicket({
    required this.movieName,
    required this.seatNumber,
    required this.ticketPrice,
  });

  factory MovieTicket.fromJson(Map<String, dynamic> json) {
    return MovieTicket(
      movieName: json["movieName"],
      seatNumber: json["seatNumber"],
      ticketPrice: json["ticketPrice"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "movieName": movieName,
      "seatNumber": seatNumber,
      "ticketPrice": ticketPrice,
    };
  }
}
