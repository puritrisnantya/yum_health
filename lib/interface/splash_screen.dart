import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:yum_health/common/style.dart';
import 'package:yum_health/interface/landing_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 5000,
      backgroundColor: primaryColor,
      splash: Image.asset(
        'assets/pancake.jpg',
      ),
      nextScreen: const LandingPage(),
    );
  }
}
