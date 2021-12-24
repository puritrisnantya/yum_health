import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yum_health/data/model/resep_model.dart';

class DatabaseService {
  final _reseps = FirebaseFirestore.instance.collection('resep');
  final _users = FirebaseFirestore.instance.collection('users');

  Future<List<ResepData>> getAllResep() async {
    final snapshot = await _reseps.get();
    final _resepList =
        snapshot.docs.map((e) => ResepData.fromObject(e)).toList();
    return _resepList;
  }

  Future<ResepData> getResepById(String id) async {
    final snapshot = await _reseps.doc(id).get();
    final _resep = ResepData.fromDocumentObject(snapshot);
    return _resep;
  }

  Future<List<ResepData>> getListSearch(String input) async {
    final filteredData = (await _reseps.get()).docs.map((e) {
      if (e
          .data()['name']
          .toString()
          .toLowerCase()
          .contains(input.toLowerCase())) {
        return e;
      }
    }).toList();

    List<ResepData> _resepList = [];
    for (var e in filteredData) {
      if (e != null) {
        final data = ResepData.fromObject(e);
        _resepList.add(data);
      }
    }
    return _resepList;
  }

  Future<void> inputFavorite(String idUser, String idResep) async {
    final firebase = FirebaseFirestore.instance
        .collection('users')
        .doc(idUser)
        .collection('favorites')
        .doc(idResep);
    await firebase.set({'addAt': Timestamp.fromDate(DateTime.now())});
  }

  Future<void> removeFavorite(String idUser, String idResep) async {
    final firebase = FirebaseFirestore.instance
        .collection('users')
        .doc(idUser)
        .collection('favorites')
        .doc(idResep);
    await firebase.delete();
  }

  Future<List<String>> getAllFavorite(String idUser) async {
    final snapshot = await _users.doc(idUser).collection('favorites').get();
    final _resepList = snapshot.docs.map((e) => e.id).toList();
    return _resepList;
  }
}
