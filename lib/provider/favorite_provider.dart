import 'package:flutter/material.dart';
import 'package:yum_health/data/database/favorite_database.dart';
import 'package:yum_health/data/temporary_data.dart';
import 'package:yum_health/helper/state_helper.dart';

class FavoriteProvider extends ChangeNotifier {
  FavoriteProvider() {
    _dbFavorite = DatabaseFavorite();
    _getAllFavorite();
  }

  late DatabaseFavorite _dbFavorite;
  List<Resep> _favorite = [];
  late ResultState _state;
  late ResultState _favoriteState;
  final IconData _icon = Icons.favorite_outline;

  List<Resep> get favorite => _favorite;

  IconData get icon => _icon;

  ResultState get state => _state;

  ResultState get favoriteState => _favoriteState;

  void _getAllFavorite() async {
    _state = ResultState.loading;
    notifyListeners();
    try {
      final results = await _dbFavorite.getFavorit();
      if (results.isNotEmpty) {
        _favorite = results;
        _state = ResultState.hasData;
        notifyListeners();
      } else {
        _state = ResultState.noData;
        _favorite.clear();
        notifyListeners();
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
    }
  }

  void refreshData() {
    _getAllFavorite();
  }
}
