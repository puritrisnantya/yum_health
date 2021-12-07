import 'package:flutter/material.dart';
import 'package:yum_health/common/style.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile_page';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: myTextTheme.headline1,
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'Username',
              style: myTextTheme.headline4,
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Kim_Jisoo',
                  style: myTextTheme.headline4,
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              'Email',
              style: myTextTheme.headline4,
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'kimjiso95@gmail.com',
                  style: myTextTheme.headline4,
                ),
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                child: Text(
                  'Keluar',
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
      )),
    );
  }
}
