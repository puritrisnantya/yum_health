import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_health/common/style.dart';
import 'package:yum_health/interface/sign_up_page.dart';
import 'package:yum_health/provider/auth_provider.dart';
import 'package:yum_health/provider/favorite_provider.dart';
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',
                  style: myTextTheme.headline1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Sign in to Backup Your Progress',
                  style: myTextTheme.bodyText1,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(),
                      border: const OutlineInputBorder(),
                      isDense: true,
                      labelText: 'Email',
                      labelStyle: myTextTheme.bodyText1),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(),
                      border: const OutlineInputBorder(),
                      isDense: true,
                      labelText: 'Password',
                      labelStyle: myTextTheme.bodyText1),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                TextButton(
                  onPressed: () async {
                    final result =
                        await Provider.of<AuthProvider>(context, listen: false)
                            .signIn(
                      _emailController.text,
                      _passwordController.text,
                    );
                    if (result == "isSuccess") {
                      Provider.of<FavoriteProvider>(context, listen: false)
                          .getFavoritListData();
                      Navigator.pushReplacementNamed(
                          context, NavigationBarRouter.routeName);
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(result)));
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
                const SizedBox(
                  height: 20.0,
                ),
                Row(
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
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            color: primaryColor, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
