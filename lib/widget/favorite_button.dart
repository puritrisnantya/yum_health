import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_health/helper/state_helper.dart';
import 'package:yum_health/provider/favorite_provider.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({Key? key, required this.idResep}) : super(key: key);

  final String idResep;

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(builder: (context, newData, chill) {
      return Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF1F1F1),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: IconButton(
          icon: Icon(
            newData.icon,
            color: Colors.red,
          ),
          onPressed: () async {
            if (newData.favoriteState == ResultState.noData) {
              await newData.addFavorite(idResep);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.black.withOpacity(0.6),
                  content: const Text(
                    'Favorite berhasil ditambahkan',
                    textAlign: TextAlign.center,
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            } else {
              await newData.deleteFavorite(idResep);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.black.withOpacity(0.6),
                  content: const Text(
                    'Favorite berhasil dihapus',
                    textAlign: TextAlign.center,
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            }
          },
        ),
      );
    });
  }
}
