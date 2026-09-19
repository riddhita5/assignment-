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
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController referralController = TextEditingController();

  final FocusNode phoneFocus = FocusNode();
  final FocusNode otpFocus = FocusNode();
  final FocusNode referralFocus = FocusNode();

  @override
  void dispose() {
    phoneController.dispose();
    otpController.dispose();
    referralController.dispose();

    phoneFocus.dispose();
    otpFocus.dispose();
    referralFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              focusNode: phoneFocus,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(otpFocus);
              },
            ),

            const SizedBox(height: 20),

            TextField(
              controller: otpController,
              focusNode: otpFocus,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'OTP',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(referralFocus);
              },
            ),

            const SizedBox(height: 20),

            TextField(
              controller: referralController,
              focusNode: referralFocus,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                labelText: 'Referral Code',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
