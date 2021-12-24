import 'package:flutter/material.dart';
import 'package:yum_health/common/style.dart';
import 'package:yum_health/interface/sign_in_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);
  static const routeName = '/landing_page';

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
                        'Makanan Sehat',
                        style: myTextTheme.headline5,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Makanan sehat adalah makanan yang memberi Anda nutrisi yang Anda butuhkan untuk mempertahankan kesejahteraan tubuh Anda dan mempertahankan energi. Air, karbohidrat, lemak, protein, vitamin, dan mineral adalah nutrisi utama yang membentuk pola makan yang sehat dan seimbang.',
                        style: myTextTheme.bodyText1,
                        textAlign: TextAlign.justify,
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
                onPressed: () {
                  Navigator.pushReplacementNamed(context, SignInPage.routeName);
                },
                child: Container(
                  child: Text(
                    'Lanjut',
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
