import 'package:flutter/material.dart';
import 'package:yum_health/data/database/auth/auth_service.dart';
import 'package:yum_health/data/database/firestore/resep_db_service.dart';
import 'package:yum_health/data/model/resep_model.dart';
import 'package:yum_health/helper/state_helper.dart';

class FavoriteProvider extends ChangeNotifier {
  FavoriteProvider() {
    _dbService = DatabaseService();
    _getAllFavorite();
    getFavoritListData();
  }

  late DatabaseService _dbService;
  List<String> _favorite = [];
  late ResepData _favoriteDetail;
  late ResultState _state;
  late ResultState _favoriteState;
  IconData _icon = Icons.favorite_outline;

  late List<ResepData> _listResep;
  List<ResepData> get listResep => _listResep;

  List<String> get favorite => _favorite;
  ResepData get favoriteDetail => _favoriteDetail;

  IconData get icon => _icon;

  ResultState get state => _state;

  ResultState get favoriteState => _favoriteState;

  void _getAllFavorite() async {
    _state = ResultState.loading;
    notifyListeners();
    try {
      final results =
          await _dbService.getAllFavorite(AuthService().auth.currentUser!.uid);
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

  Future<ResepData?> getFavoriteData(String id) async {
    try {
      final results = await _dbService.getResepById(id);
      return _favoriteDetail = results;
    } catch (e) {
      return null;
    }
  }

  Future getFavoritListData() async {
    _favoriteState = ResultState.loading;
    notifyListeners();
    try {
      _listResep = [];
      final result =
          await _dbService.getAllFavorite(AuthService().auth.currentUser!.uid);
      final List<ResepData> listResep = [];
      for (var e in result) {
        final data = await _dbService.getResepById(e);
        listResep.add(data);
      }
      _listResep = listResep;
      if (result.isEmpty) {
        _favoriteState = ResultState.noData;
      } else {
        _favoriteState = ResultState.hasData;
      }
      notifyListeners();
    } catch (e) {
      _favoriteState = ResultState.error;
      notifyListeners();
    }
  }

  Future getFavoriteById(String idResep) async {
    try {
      final result =
          await _dbService.getAllFavorite(AuthService().auth.currentUser!.uid);
      bool isFounded = false;
      for (var e in result) {
        if (e == idResep) {
          isFounded = true;
        }
      }
      if (isFounded) {
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

  Future<void> addFavorite(String idResep) async {
    await _dbService.inputFavorite(
        AuthService().auth.currentUser!.uid, idResep);
    getFavoritListData();
    _icon = Icons.favorite;
    getFavoriteById(idResep);
  }

  Future<void> deleteFavorite(String idResep) async {
    await _dbService.removeFavorite(
        AuthService().auth.currentUser!.uid, idResep);
    getFavoritListData();
    _icon = Icons.favorite_outline;
    getFavoriteById(idResep);
  }
}
