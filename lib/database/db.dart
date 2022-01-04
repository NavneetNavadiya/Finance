// ignore_for_file: constant_identifier_names, import_of_legacy_library_into_null_safe

import 'dart:async';
import 'dart:convert';

import 'package:finance/bill.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../bill.dart';

bool isLoading = false;
late List<Bill> Bills;

class DBhelper {
  static const String COLUMN_ID = "id";
  static const String COLUMN_DATE = 'date';
  static const String COLUMN_VALUE = 'value';
  static const String COLUMN_TYPE = 'type';
  static const String COLUMN_NOTE = 'note';
  static const String TABLE = 'Bill';

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
          'CREATE TABLE $TABLE ($COLUMN_ID  INTEGER PRIMARY KEY AUTOINCREMENT  , $COLUMN_DATE TEXT, $COLUMN_VALUE DOUBLE, $COLUMN_TYPE TEXT, $COLUMN_NOTE TEXT)');
    });
  }

  Future<void> insertBill(bill) async {
    final db = await instance.database;
    String date = bill.getDate();
    double value = bill.getValue();
    String type = bill.getType();
    String note = bill.getNote();
    await db?.rawInsert(
        'INSERT INTO $TABLE (${DBhelper.COLUMN_DATE}, ${DBhelper.COLUMN_VALUE},${DBhelper.COLUMN_TYPE},${DBhelper.COLUMN_NOTE}) VALUES (?,?,?,?)',
        [date, value, type, note]);
    // db?.insert(
    //   'Spend',
    //   spend.toMap(),
    //   conflictAlgorithm: ConflictAlgorithm.replace,
    // );
  }

  Future<List<Bill>> PrintAll() async {
    final db = await instance.database;

    // Query the table for all The spend.
    final List<Map<String, dynamic>> maps = await db!.query(TABLE);

    // Convert the List<Map<String, dynamic> into a List<spend>.
    return List.generate(maps.length, (i) {
      return Bill(
          id: maps[i]['id'],
          date: maps[i]['date'],
          value: maps[i]['value'],
          type: maps[i]['type'],
          note: maps[i]['note']);
    });
  }

  // ignore: non_constant_identifier_names
  // Future<List<Map<String, dynamic>>> SpendTable() async {
  //   final db = await instance.database;

  //   return await db!.query('Spend');
  // }
}
