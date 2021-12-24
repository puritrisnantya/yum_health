import 'package:flutter/material.dart';
import 'package:yum_health/data/database/firestore/resep_db_service.dart';
import 'package:yum_health/data/model/resep_model.dart';
import 'package:yum_health/helper/state_helper.dart';

class ResepProvider extends ChangeNotifier {
  DatabaseService dbService;
  ResepProvider({required this.dbService}) {
    _fetchAllResep();
  }
  late List<ResepData> _listResep;
  List<ResepData> get listResep => _listResep;

  late ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  Future<dynamic> _fetchAllResep() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final resep = await dbService.getAllResep();
      if (resep.isEmpty) {
        _listResep = [];
        _message = 'Empty data';
        _state = ResultState.noData;
        notifyListeners();
      } else {
        _listResep = resep;
        _state = ResultState.hasData;
        notifyListeners();
      }
    } catch (e) {
      _message = 'Error to load data, try again';
      _state = ResultState.error;
      notifyListeners();
    }
  }
}
