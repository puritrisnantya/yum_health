import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_health/common/style.dart';
import 'package:yum_health/data/model/resep_model.dart';
import 'package:yum_health/helper/state_helper.dart';
import 'package:yum_health/interface/detail_page.dart';
import 'package:yum_health/provider/favorite_provider.dart';
import 'package:yum_health/provider/resep_provider.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<ResepProvider>(builder: (context, snapshot, child) {
        if (snapshot.state == ResultState.hasData) {
          return ListView.builder(
              itemCount: snapshot.listResep.length,
              itemBuilder: (BuildContext context, int index) {
                return _listItem(context, snapshot.listResep[index]);
              });
        } else {
          return Container();
        }
      }),
    );
  }
}

Widget _listItem(BuildContext context, ResepData resep) {
  return InkWell(
      onTap: () {
        Provider.of<FavoriteProvider>(context, listen: false)
            .getFavoriteById(resep.id);
        Navigator.pushNamed(context, DetailPage.routeName, arguments: resep);
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
                height: 90,
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
                        height: 3,
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
