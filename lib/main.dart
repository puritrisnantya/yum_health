import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_health/data/database/auth/auth_service.dart';
import 'package:yum_health/data/database/firestore/resep_db_service.dart';
import 'package:yum_health/data/model/resep_model.dart';
import 'package:yum_health/interface/calculate_bmi_page.dart';
import 'package:yum_health/interface/detail_page.dart';
import 'package:yum_health/interface/landing_page.dart';
import 'package:yum_health/interface/profile_page.dart';
import 'package:yum_health/interface/search_page.dart';
import 'package:yum_health/interface/sign_in_page.dart';
import 'package:yum_health/interface/sign_up_page.dart';
import 'package:yum_health/interface/splash_screen.dart';
import 'package:yum_health/provider/auth_provider.dart';
import 'package:yum_health/provider/favorite_provider.dart';
import 'package:yum_health/provider/resep_provider.dart';
import 'package:yum_health/utils/navigation_bar_router.dart';
import 'common/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (_) => AuthProvider(authService: AuthService())),
        ChangeNotifierProvider<ResepProvider>(
            create: (_) => ResepProvider(dbService: DatabaseService())),
        ChangeNotifierProvider<FavoriteProvider>(
          create: (_) => FavoriteProvider(),
        )
      ],
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
          SignInPage.routeName: (context) => const SignInPage(),
          SignUpPage.routeName: (context) => const SignUpPage(),
          CalculatePage.routeName: (context) => const CalculatePage(),
          ProfilePage.routeName: (context) => const ProfilePage(),
          SearchPage.routeName: (context) => const SearchPage(),
          DetailPage.routeName: (context) => DetailPage(
              resep: ModalRoute.of(context)?.settings.arguments as ResepData?),
        },
      ),
    );
  }
}
