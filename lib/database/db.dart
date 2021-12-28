import 'dart:async';
import 'dart:convert';

import 'package:finance/spend.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../SpendingPage.dart';

class DBhelper {
  static const String COLUMN_ID = "id";
  static const String COLUMN_DATE = 'date';
  static const String COLUMN_VALUE = 'value';
  static const String COLUMN_TYPE = 'type';

  static final DBhelper instance = DBhelper._init();
  DBhelper._init();

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();
    return await openDatabase(join(dbPath, 'data.db'), version: 1,
        onCreate: (Database database, int version) async {
      print("database has been created");

      await database.execute(
          'CREATE TABLE Spend ($COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT , $COLUMN_DATE TEXT, $COLUMN_VALUE DOUBLE, $COLUMN_TYPE TEXT)');
    });
  }

  Future<void> insertSpend(spend) async {
    final db = await instance.database;

    db?.insert(
      'Spend',
      spend.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // ignore: non_constant_identifier_names
  Future<List<Spend>> PrintAll() async {
    final db = await instance.database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db!.query('Spend');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Spend(
          id: maps[i]['id'],
          date: maps[i]['date'],
          value: maps[i]['value'],
          type: maps[i]['type']);
    });
  }
}
