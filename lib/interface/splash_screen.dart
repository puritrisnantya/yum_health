import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yum_health/common/style.dart';
import 'package:yum_health/interface/landing_page.dart';
import 'package:yum_health/utils/navigation_bar_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // ignore: must_call_super
  void initState() {
    Timer(Duration(seconds: 5), () {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, LandingPage.routeName, (route) => false);
      } else {
        print(user.email);

        Navigator.pushNamedAndRemoveUntil(
            context, NavigationBarRouter.routeName, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.only(bottom: 50),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/logo.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
