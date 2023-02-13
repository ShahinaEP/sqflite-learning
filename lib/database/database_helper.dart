import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_learning/model/profile_model.dart';

class DbHelper {
  static Database? _database;

  Future<Database?> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await initalDatabase();
    return _database;
  }

  Future<Database> initalDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    var openDB =
    openDatabase(documentDirectory.path, version: 1, onCreate: _onCreate);
    return openDB;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE profile
      
      (
      
      id INTEGER PRIMARY KEY,
      username TEXT,
      address TEXT,
      phone TEXT,
      birthDate TEXT,
      email TEXT,
      createdAt TEXT
      
      )
      
      
      
      ''');
  }

  Future insertProductData(ProfliteModel ProfliteModel) async {
    Database? database = await db;
    return await database?.insert("profile", ProfliteModel.toJson());
  }

  Future<List<ProfliteModel>?> getProductData() async {
    Database? database = await db;
    var data = await database!.query("profile", orderBy: "id");
    List<ProfliteModel> profileModel =
    data.map((e) => ProfliteModel.fromJson(e)).toList();
    return profileModel;
  }
}