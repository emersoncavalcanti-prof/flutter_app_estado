import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 120),
            Lottie.network(
              'https://lottie.host/184fd23e-0706-4c9f-a1c4-92b7a8e89782/X4jl69g5Y6.json',
            ),
            CircularProgressIndicator(color: Colors.white, strokeWidth: 5),
          ],
        ),
      ),
    );
  }
}
