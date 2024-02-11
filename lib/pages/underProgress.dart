import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UnderMaintancePage extends StatefulWidget {
  const UnderMaintancePage({super.key});

  @override
  State<UnderMaintancePage> createState() => _UnderMaintancePageState();
}

class _UnderMaintancePageState extends State<UnderMaintancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Lottie.network(
                'https://assets7.lottiefiles.com/private_files/lf30_y9czxcb9.json',
                height: 256,
                fit: BoxFit.cover,
                animate: true,
              ),
            ),
            const Text(
              "App Under Progress...",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 57, 30, 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
