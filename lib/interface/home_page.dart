import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_health/common/style.dart';
import 'package:yum_health/helper/state_helper.dart';
import 'package:yum_health/interface/search_page.dart';
import 'package:yum_health/provider/auth_provider.dart';
import 'package:yum_health/widget/list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 5),
          child: Column(
            children: [
              Consumer<AuthProvider>(builder: (context, snapshot, child) {
                if (snapshot.state == ResultState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                } else if (snapshot.state == ResultState.hasData) {
                  return Text(
                    'Halo, ${snapshot.user.username}',
                    style: myTextTheme.headline2,
                  );
                } else {
                  return const Text('Error');
                }
              }),
              Text(
                'Ingin makan makanan sehat?',
                style: myTextTheme.headline4,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 78,
                      padding: const EdgeInsets.only(left: 15),
                      child: Transform.rotate(
                        angle: 0.5,
                        child: Image.asset(
                          'images/avocado.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kesehatan tubuh datang dengan nutrisi yang baik',
                              style: myTextTheme.headline6,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Dapatkan nutrisi yang bagus sekarang!',
                              style: myTextTheme.subtitle2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Resep Makanan',
                    style: myTextTheme.headline3,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SearchPage.routeName);
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Color(0xFF636363),
                    ),
                  )
                ],
              ),
              const ListViewBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
