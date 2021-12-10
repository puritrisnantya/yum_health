import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_health/data/database/favorite_database.dart';
import 'package:yum_health/data/temporary_data.dart';
import 'package:yum_health/helper/state_helper.dart';
import 'favorite_provider.dart';

class ChangeFavoriteProvider extends ChangeNotifier {
  String id;
  BuildContext context;
  ChangeFavoriteProvider({required this.id, required this.context}) {
    _dbFavorite = DatabaseFavorite();
    _getFavoriteById();
  }

  late DatabaseFavorite _dbFavorite;
  late ResultState _favoriteState;
  IconData _icon = Icons.favorite_outline;

  IconData get icon => _icon;

  ResultState get favoriteState => _favoriteState;

  Future _getFavoriteById() async {
    try {
      final result = await _dbFavorite.getFavoriteById(id);
      if (result != null) {
        _favoriteState = ResultState.hasData;
        _icon = Icons.favorite;
        notifyListeners();
      } else {
        _favoriteState = ResultState.noData;
        _icon = Icons.favorite_outline;
        notifyListeners();
      }
    } catch (e) {
      _favoriteState = ResultState.error;
      notifyListeners();
    }
  }

  Future<void> addFavorite(Resep data) async {
    await _dbFavorite.insertFavoriteRestaurant(data);
    Provider.of<FavoriteProvider>(context, listen: false).refreshData();
    _icon = Icons.favorite;
    notifyListeners();
  }

  Future<void> deleteFavorite() async {
    await _dbFavorite.deleteFavoriteRestaurant(id);
    Provider.of<FavoriteProvider>(context, listen: false).refreshData();
    _icon = Icons.favorite_outline;
    notifyListeners();
  }
}
