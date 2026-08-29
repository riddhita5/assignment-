import 'package:flutter/material.dart';

import '../payment_service.dart';
import '../services/services_locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final paymentService = getIt<PaymentService>();

            paymentService.payWithUPI(500);
          },
          child: const Text("Pay with UPI"),
        ),
      ),
    );
  }
}