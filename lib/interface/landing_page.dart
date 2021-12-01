import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 25, right: 25, bottom: 15, top: 15),
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 12,
                child: Image.asset(
                  'images/pancake.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Card(
                color: const Color(0xFFF1F1F1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'Healthy Foods',
                        style: myTextTheme.headline5,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Healthy foods are those that provide you with the nutrients you need to sustain your body’s well-being and retain energy. Water, carbohydrates, fat, protein, vitamins, and minerals are the key nutrients that make up a healthy, balanced diet.',
                        style: myTextTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(),
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                  child: Text(
                    'Next',
                    textAlign: TextAlign.center,
                    style: myTextTheme.button,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  width: size.width - 70,
                ),
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
