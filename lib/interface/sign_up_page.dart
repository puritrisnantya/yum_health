import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_health/common/style.dart';
import 'package:yum_health/interface/sign_in_page.dart';
import 'package:yum_health/provider/auth_provider.dart';
import 'package:yum_health/provider/favorite_provider.dart';
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Buat akunmu',
                  style: myTextTheme.headline1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Buat akun Anda untuk memulai perjalanan',
                  style: myTextTheme.bodyText1,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(),
                      border: const OutlineInputBorder(),
                      isDense: true,
                      labelText: 'Nama Pengguna',
                      labelStyle: myTextTheme.bodyText1),
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
                Consumer<AuthProvider>(builder: (context, snapshot, child) {
                  return TextButton(
                    onPressed: () async {
                      if (_passwordController.text.isNotEmpty &&
                          _usernameController.text.isNotEmpty &&
                          _emailController.text.isNotEmpty) {
                        final result = await Provider.of<AuthProvider>(context,
                                listen: false)
                            .signUp(
                          _usernameController.text,
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
                      } else {
                        if (_usernameController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'the username field cannot be empty')));
                        } else if (_passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'the password field cannot be empty')));
                        } else if (_emailController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the email field cannot be empty')));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Error')));
                        }
                      }
                    },
                    child: Container(
                      child: Text(
                        'Daftar',
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
                  );
                }),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun? ',
                      style: myTextTheme.subtitle1,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, SignInPage.routeName);
                      },
                      child: const Text(
                        'Masuk',
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
