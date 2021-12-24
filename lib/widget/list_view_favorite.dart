import 'package:flutter/material.dart';
import 'package:yum_health/common/style.dart';
import 'package:yum_health/data/model/resep_model.dart';
import 'package:yum_health/interface/detail_page.dart';
import 'package:yum_health/provider/favorite_provider.dart';

class ListViewFavorite extends StatelessWidget {
  const ListViewFavorite(
      {Key? key, required this.resep, required this.favoriteProvider})
      : super(key: key);
  final List<ResepData> resep;
  final FavoriteProvider favoriteProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: resep.length,
        itemBuilder: (BuildContext context, int index) {
          return _listItem(context, resep[index], favoriteProvider);
        });
  }
}

Widget _listItem(
    BuildContext context, ResepData resep, FavoriteProvider favoriteProvider) {
  return InkWell(
      onTap: () async {
        favoriteProvider.getFavoriteById(resep.id);
        final data = await favoriteProvider.getFavoriteData(resep.id);
        Navigator.pushNamed(context, DetailPage.routeName, arguments: data);
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        height: 118,
        child: Card(
          color: const Color(0xFFF1F1F1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                height: 108 - 18,
                width: 80,
                margin: const EdgeInsets.only(bottom: 9, top: 9, left: 9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(resep.imageLink), fit: BoxFit.cover),
                ),
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        resep.name,
                        style: myTextTheme.headline5,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        resep.description,
                        style: myTextTheme.subtitle1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
}
