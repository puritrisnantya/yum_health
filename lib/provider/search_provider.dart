import 'package:flutter/material.dart';
import 'package:yum_health/data/database/firestore/resep_db_service.dart';
import 'package:yum_health/data/model/resep_model.dart';
import 'package:yum_health/helper/state_helper.dart';

class SearchProvider extends ChangeNotifier {
  DatabaseService dbService;
  SearchProvider({required this.dbService}) {
    _state = ResultState.noInput;
  }

  List<ResepData> _listData = [];
  late ResultState _state;

  ResultState get state => _state;
  List<ResepData> get listData => _listData;

  searchData(String input) async {
    _state = ResultState.loading;
    notifyListeners();
    try {
      if (input.isNotEmpty) {
        final snapshot = await dbService.getListSearch(input);
        if (snapshot.isNotEmpty) {
          _listData = snapshot;
          _state = ResultState.hasData;
        } else {
          _state = ResultState.noData;
        }
      } else {
        _state = ResultState.noInput;
      }
    } catch (e) {
      _state = ResultState.error;
    }
    notifyListeners();
  }
}
