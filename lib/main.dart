import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_health/data/temporary_data.dart';
import 'package:yum_health/interface/calculate_bmi_page.dart';
import 'package:yum_health/interface/detail_page.dart';
import 'package:yum_health/interface/landing_page.dart';
import 'package:yum_health/interface/profile_page.dart';
import 'package:yum_health/interface/sign_in_page.dart';
import 'package:yum_health/interface/sign_up_page.dart';
import 'package:yum_health/interface/splash_screen.dart';
import 'package:yum_health/provider/favorite_provider.dart';
import 'package:yum_health/utils/navigation_bar_router.dart';
import 'common/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FavoriteProvider>(
      create: (_) => FavoriteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'YumHealth',
        theme: ThemeData(
          primaryColor: primaryColor,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
        ),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          LandingPage.routeName: (context) => const LandingPage(),
          NavigationBarRouter.routeName: (context) =>
              const NavigationBarRouter(),
          SignInPage.routeName: (context) => SignInPage(),
          SignUpPage.routeName: (context) => SignUpPage(),
          CalculatePage.routeName: (context) => CalculatePage(),
          ProfilePage.routeName: (context) => ProfilePage(),
          DetailPage.routeName: (context) => DetailPage(
              resep: ModalRoute.of(context)?.settings.arguments as Resep?),
        },
      ),
    );
  }
}
