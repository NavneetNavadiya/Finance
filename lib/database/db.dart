// ignore_for_file: constant_identifier_names, import_of_legacy_library_into_null_safe

import 'dart:async';
import 'dart:convert';

import 'package:finance/bill.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../bill.dart';
import '../Income.dart';

late List<Bill> Bills;
late List<Income> Incomes;

class DBhelper {
  static const String ID = "id";
  static const String DATE = 'date';
  static const String VALUE = 'value';
  static const String TYPE = 'type';
  static const String NOTE = 'note';
  static const String BILL = 'Bill';
  static const String INCOME = 'Income';
  static const String BALANACE = 'Balance';

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
          'CREATE TABLE $BILL ($ID  INTEGER PRIMARY KEY AUTOINCREMENT  , $DATE TEXT, $VALUE DOUBLE, $TYPE TEXT, $NOTE TEXT)');

      await database.execute(
          'CREATE TABLE $INCOME ($ID  INTEGER PRIMARY KEY AUTOINCREMENT  , $DATE TEXT, $VALUE DOUBLE, $TYPE TEXT)');
      await database.execute(
          'CREATE TABLE $BALANACE ($ID  INTEGER PRIMARY KEY AUTOINCREMENT  , $DATE TEXT, $VALUE DOUBLE)');
    });
  }

  Future<void> insertBill(bill) async {
    final db = await instance.database;
    String date = bill.getDate();
    double value = bill.getValue();
    String type = bill.getType();
    String note = bill.getNote();
    await db?.rawInsert(
        'INSERT INTO $BILL (${DBhelper.DATE}, ${DBhelper.VALUE},${DBhelper.TYPE},${DBhelper.NOTE}) VALUES (?,?,?,?)',
        [date, value, type, note]);
  }

  Future<void> insertIcome(income) async {
    final db = await instance.database;
    String date = income.getDate();
    double value = income.getAmount();
    String type = income.getType();
    await db?.rawInsert(
        'INSERT INTO $INCOME (${DBhelper.DATE}, ${DBhelper.VALUE},${DBhelper.TYPE}) VALUES (?,?,?)',
        [date, value, type]);
  }

  Future<List<Bill>> PrintBills() async {
    final db = await instance.database;

    // Query the table for all The bill.
    final List<Map<String, dynamic>> maps = await db!.query(BILL);

    // Convert the List<Map<String, dynamic> into a List<bill>.
    return List.generate(maps.length, (i) {
      return Bill(
          id: maps[i]['id'],
          date: maps[i]['date'],
          value: maps[i]['value'],
          type: maps[i]['type'],
          note: maps[i]['note']);
    });
  }

  Future<List<Income>> PrintIncomes() async {
    final db = await instance.database;

    // Query the table for all The inocme.
    final List<Map<String, dynamic>> maps = await db!.query(INCOME);

    // Convert the List<Map<String, dynamic> into a List<income>.
    return List.generate(maps.length, (i) {
      return Income(
        id: maps[i]['id'],
        date: maps[i]['date'],
        amount: maps[i]['value'],
        type: maps[i]['type'],
      );
    });
  }

  Future printTotalBills() async {
    final db = await instance.database;
    var total;
    total = db?.rawQuery('select SUM($VALUE) as Total from $BILL');
    return total.toList;
  }
}
