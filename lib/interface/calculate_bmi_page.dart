import 'package:flutter/material.dart';
import 'package:yum_health/common/style.dart';

class CalculatePage extends StatefulWidget {
  static const routeName = '/calculate_page';
  const CalculatePage({Key? key}) : super(key: key);

  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  static String _textResult = '';
  static String _textDescription = '';

  void calculateBMI() {
    setState(() {
      double height = double.parse(_heightController.text) / 100;
      double weight = double.parse(_weightController.text);

      double heightSquare = height * height;
      double result = weight / heightSquare;
      if (result < 18.5) {
        print('Berat Badan Kurang');
        _textResult = 'Berat Badan Kurang';
        _textDescription =
            'Level Status BMI Anda adalah Kurang berat badan. Tingkatkan berat badan ideal Anda dengan berkonsultasi dengan ahli gizi Anda.';
      } else if (result < 22.9) {
        print('Berat Badan Normal');
        _textResult = 'Berat Badan Normal';
        _textDescription =
            'Level Status BMI Anda adalah Normal. Pertahankan berat badan Anda dengan makanan yang sehat dan berolahraga.';
      } else if (result < 29.9) {
        print('Kecenderungan Obesitas');
        _textResult = 'Kecenderungan Obesitas';
        _textDescription =
            'Level Status BMI Anda adalah Kelebihan berat badan. Kurangi Berat badan Anda dengan berolahraga dan batasi asupan kalori sesuai anjurkan ahli gizi Anda.';
      } else {
        print('Obesitas');
        _textResult = 'Obesitas';
        _textDescription =
            'Level Status BMI Anda adalah Obesitas. Kurangi Berat badan Anda dengan berolahraga dan batasi asupan kalori sesuai anjurkan ahli gizi Anda.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kalkulator BMI',
                style: myTextTheme.headline1,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'BMI adalah pengukuran kurus atau kegemukan seseorang berdasarkan tinggi dan berat badan mereka, dan dimaksudkan untuk mengukur massa jaringan.',
                textAlign: TextAlign.justify,
                style: myTextTheme.bodyText1,
              ),
              SizedBox(
                height: 40.0,
              ),
              TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    isDense: true,
                    labelText: 'Tinggi Badan',
                    labelStyle: myTextTheme.bodyText1),
              ),
              SizedBox(
                height: 25.0,
              ),
              TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    isDense: true,
                    labelText: 'Berat Badan',
                    labelStyle: myTextTheme.bodyText1),
              ),
              SizedBox(
                height: 60.0,
              ),
              TextButton(
                onPressed: () {
                  calculateBMI();
                },
                child: Container(
                  child: Text(
                    'Hitung',
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
              SizedBox(
                height: 30.0,
              ),
              Center(
                child: Card(
                  color: Color(0xFF498D43),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                    child: Text(
                      _textResult == '' ? 'Hasil' : _textResult,
                      style: myTextTheme.headline6,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                _textDescription,
                style: myTextTheme.headline4,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 202.0,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
