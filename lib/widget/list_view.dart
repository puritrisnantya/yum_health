import 'package:flutter/material.dart';
import 'package:yum_health/common/style.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: resepList.length,
          itemBuilder: (BuildContext context, int index) {
            return _listItem(context, resepList[index]);
          }),
    );
  }
}

Widget _listItem(BuildContext context, Resep resep) {
  return InkWell(
      onTap: () {
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
                height: 108 - 18,
                width: 80,
                margin: const EdgeInsets.only(bottom: 9, top: 9, left: 9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(resep.imageAsset), fit: BoxFit.cover),
                ),
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        resep.title,
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
