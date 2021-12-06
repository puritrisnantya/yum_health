import 'package:flutter/material.dart';
import 'package:yum_health/common/style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                'Hello, Jisoo',
                style: myTextTheme.headline2,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Want to eat healthy food?',
                style: myTextTheme.headline4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
