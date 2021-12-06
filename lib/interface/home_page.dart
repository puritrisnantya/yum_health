import 'package:flutter/material.dart';
import 'package:yum_health/common/style.dart';
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
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                'Hello, Jisoo',
                style: myTextTheme.headline2,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Want to eat healthy food?',
                style: myTextTheme.headline4,
              ),
              const SizedBox(
                height: 30,
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
                              'Health body comes with good nutrients',
                              style: myTextTheme.headline6,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Geet goods nutrients now!',
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
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular food',
                    style: myTextTheme.headline3,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'see all',
                      style: myTextTheme.subtitle1,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const ListViewBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
