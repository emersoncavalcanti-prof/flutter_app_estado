import 'package:flutter/material.dart';
import 'package:flutter_app_estado/home_page.dart';
import 'package:flutter_app_estado/splash_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
