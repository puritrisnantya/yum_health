import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yum_health/common/style.dart';
import 'package:yum_health/interface/sign_in_page.dart';
import 'package:yum_health/utils/navigation_bar_router.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = '/sign_up_page';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
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
                'Create Your Account',
                style: myTextTheme.headline1,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Create your account to start journey',
                style: myTextTheme.bodyText1,
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: _usernameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    isDense: true,
                    labelText: 'Username',
                    labelStyle: myTextTheme.bodyText1),
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
                    // ignore: unused_local_variable
                    final username = _usernameController.text;
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    Navigator.pushReplacementNamed(
                        context, NavigationBarRouter.routeName);
                  } catch (e) {
                    final snackBar = SnackBar(content: Text(e.toString()));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } finally {
                    setState(() {
                      _isLoading = false;
                    });
                  }
                },
                child: Container(
                  child: Text(
                    'Sign up',
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
                    'Already have account? ',
                    style: myTextTheme.subtitle1,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, SignInPage.routeName);
                    },
                    child: Text(
                      'Sign In',
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
