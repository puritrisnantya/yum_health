import 'package:flutter/material.dart';
import 'package:yum_health/common/style.dart';
import 'package:yum_health/widget/list_view.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);
  static const routeName = '/favorite_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Favorite food',
                style: myTextTheme.headline1,
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
