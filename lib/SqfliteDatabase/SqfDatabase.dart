import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../Models/Model.dart';
import 'package:sqflite/sqflite.dart';


class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Model ("
              "id TEXT PRIMARY KEY,"
              "title TEXT,"
              "description TEXT,"
              "displayName TEXT,"
              "meta TEXT"
              ")");
        });
  }

  newModel(Model model) async {
    final db = await database;


    var raw = await db.rawInsert(
        "INSERT Into Model ( "
            "id,"
            "title,"
            "description,"
            "displayName ,"
            "meta "
            ") "
            " VALUES (?,?,?,?,?);",
        [model.id, model.title, model.description, model.displayName,model.meta]);
    return raw;
  }




  getModel(int id) async {
    final db = await database;
    var res = await db.query("Model", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Model.fromMap(res.first) : null;
  }



  Future<List<Model>> getAllModels() async {
    final db = await database;
    var res = await db.query("Model");
    List<Model> list =
    res.isNotEmpty ? res.map((c) => Model.fromMap(c)).toList() : [];
    return list;
  }

  deleteModel(int id) async {
    final db = await database;
    return db.delete("Model", where: "id = ?", whereArgs: [id]);
  }


}