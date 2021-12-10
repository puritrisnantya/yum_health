import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:yum_health/data/temporary_data.dart';

class DatabaseFavorite {
  static late Database _database;

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  static const String _tableName = 'restaurant';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'favorite_db.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName (
             id TEXT PRIMARY KEY,
             title TEXT, description TEXT, imageAsset TEXT, label TEXT, ingredients TEXT, steps TEXT
           )''',
        );
      },
      version: 1,
    );

    return db;
  }

  Future<void> insertFavoriteRestaurant(Resep resep) async {
    final Database db = await database;
    final favoriteResep = Resep(
      id: resep.id,
      title: resep.title,
      description: resep.description,
      imageAsset: resep.imageAsset,
      label: resep.label,
      ingredients: resep.ingredients,
      steps: resep.steps,
    );
    await db.insert(_tableName, favoriteResep.toJson());
  }

  Future<List<Resep>> getFavorit() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);

    return results.map((res) => Resep.fromJson(res)).toList();
  }

  Future<Resep?> getFavoriteById(String id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.map((res) => Resep.fromJson(res)).first;
    } else {
      return null;
    }
  }

  Future<void> deleteFavoriteRestaurant(String id) async {
    final db = await database;

    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
