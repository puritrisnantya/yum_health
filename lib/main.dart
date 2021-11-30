import 'package:flutter/material.dart';
import 'package:yum_health/interface/splash_screen.dart';
import 'common/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YumHealth',
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
      ),
      initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen': (context) => const SplashScreen(),
      },
    );
  }
}
