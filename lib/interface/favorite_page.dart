import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_health/common/style.dart';
import 'package:yum_health/helper/state_helper.dart';
import 'package:yum_health/provider/favorite_provider.dart';
import 'package:yum_health/widget/list_view_favorite.dart';

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
              Expanded(
                child: Consumer<FavoriteProvider>(
                  builder: (context, snapshot, child) {
                    var state = snapshot.favoriteState;
                    if (state == ResultState.loading) {
                      return const Center(
                          child:
                              CircularProgressIndicator(color: primaryColor));
                    } else if (state == ResultState.hasData) {
                      var resep = snapshot.listResep;
                      return ListViewFavorite(
                          resep: resep, favoriteProvider: snapshot);
                    } else {
                      return Center(
                          child: Text('Empty', style: myTextTheme.bodyText1));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
