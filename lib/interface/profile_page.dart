import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_health/common/style.dart';
import 'package:yum_health/helper/state_helper.dart';
import 'package:yum_health/interface/sign_in_page.dart';
import 'package:yum_health/provider/auth_provider.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile_page';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profil',
                style: myTextTheme.headline1,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Nama Pengguna',
                style: myTextTheme.headline4,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Consumer<AuthProvider>(
                      builder: (context, snapshot, child) {
                    if (snapshot.state == ResultState.loading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      );
                    } else if (snapshot.state == ResultState.hasData) {
                      return Text(
                        snapshot.user.username,
                        style: myTextTheme.headline4,
                      );
                    } else {
                      return const Text('Error');
                    }
                  }),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'Email',
                style: myTextTheme.headline4,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Consumer<AuthProvider>(
                      builder: (context, snapshot, child) {
                    if (snapshot.state == ResultState.loading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      );
                    } else if (snapshot.state == ResultState.hasData) {
                      return Text(
                        snapshot.user.email,
                        style: myTextTheme.headline4,
                      );
                    } else {
                      return const Text('Error');
                    }
                  }),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextButton(
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.pushReplacementNamed(context, SignInPage.routeName);
                },
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
        ),
      )),
    );
  }
}
