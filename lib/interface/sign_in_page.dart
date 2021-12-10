import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yum_health/common/style.dart';
import 'package:yum_health/interface/sign_up_page.dart';
import 'package:yum_health/utils/navigation_bar_router.dart';

class SignInPage extends StatefulWidget {
  static const routeName = '/sign_in_page';
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  // ignore: unused_field
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back!',
                style: myTextTheme.headline1,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Sign in to Backup Your Progress',
                style: myTextTheme.bodyText1,
              ),
              SizedBox(
                height: 25.0,
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    isDense: true,
                    labelText: 'Email',
                    labelStyle: myTextTheme.bodyText1),
              ),
              SizedBox(
                height: 25.0,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    isDense: true,
                    labelText: 'Password',
                    labelStyle: myTextTheme.bodyText1),
              ),
              SizedBox(
                height: 60.0,
              ),
              TextButton(
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  try {
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    await _auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    Navigator.pushReplacementNamed(
                        context, NavigationBarRouter.routeName);
                  } catch (e) {
                    print(e);
                    final snackbar =
                        SnackBar(content: Text('Data tidak valid'));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  } finally {
                    setState(() {
                      _isLoading = false;
                    });
                  }
                },
                child: Container(
                  child: Text(
                    'Sign in',
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
              Spacer(),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account? ',
                    style: myTextTheme.subtitle1,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, SignUpPage.routeName);
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
