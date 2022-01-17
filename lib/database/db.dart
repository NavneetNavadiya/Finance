// ignore_for_file: constant_identifier_names, import_of_legacy_library_into_null_safe

import 'dart:async';
import 'dart:convert';

import 'package:finance/bill.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../bill.dart';
import '../Income.dart';

late var bill = '0.0';
late var income = '0.0';
late var balance = '0.0';
late var avg = '0.0';

class DBhelper {
  static const String ID = "id";
  static const String DATE = 'date';
  static const String VALUE = 'value';
  static const String TYPE = 'type';
  static const String NOTE = 'note';
  static const String BILL = 'Bill';
  static const String INCOME = 'Income';
  static const String BALANCE = 'Balance';

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
          'CREATE TABLE $BALANCE ($ID  INTEGER PRIMARY KEY AUTOINCREMENT  , $DATE TEXT, $VALUE DOUBLE)');
      await database.rawInsert(
          'INSERT INTO $BALANCE (${DBhelper.DATE},${DBhelper.VALUE}) VALUES (?,?)',
          ['', 0]);
    });
  }

  Future<void> insertBill(bill) async {
    final db = await instance.database;
    String date = bill.getDate();
    double value = bill.getValue();
    String type = bill.getType();
    String note = bill.getNote();
    var balanceResult = await db
        ?.rawQuery('SELECT $VALUE FROM $BALANCE ORDER BY $ID DESC LIMIT 1');
    double _balance = balanceResult![0][VALUE] as double;
    _balance = _balance - value;
    await db?.rawInsert(
        'INSERT INTO $BALANCE (${DBhelper.DATE},${DBhelper.VALUE}) VALUES (?,?)',
        [date, _balance]);
    await db?.rawInsert(
        'INSERT INTO $BILL (${DBhelper.DATE}, ${DBhelper.VALUE},${DBhelper.TYPE},${DBhelper.NOTE}) VALUES (?,?,?,?)',
        [date, value, type, note]);
    getBillsTotal();
    getTotalBalance();
    getAvrage();
  }

  Future getBalance() async {
    final db = await instance.database;
    var balanceResult = await db
        ?.rawQuery('SELECT $VALUE FROM $BALANCE ORDER BY $ID DESC LIMIT 1');
    double _balance = balanceResult![0][VALUE] as double;
    return _balance.toString();
  }

  Future<void> insertIcome(income) async {
    final db = await instance.database;
    String date = income.getDate();
    double value = income.getAmount();
    String type = income.getType();
    var balanceResult = await db
        ?.rawQuery('SELECT $VALUE FROM $BALANCE ORDER BY $ID DESC LIMIT 1');
    double _balance = balanceResult![0][VALUE] as double;
    _balance = _balance + value;
    await db?.rawInsert(
        'INSERT INTO $BALANCE (${DBhelper.DATE},${DBhelper.VALUE}) VALUES (?,?)',
        [date, _balance]);

    await db?.rawInsert(
        'INSERT INTO $INCOME (${DBhelper.DATE}, ${DBhelper.VALUE},${DBhelper.TYPE}) VALUES (?,?,?)',
        [date, value, type]);
    getBillsTotal();
    getTotalBalance();
    getAvrage();
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
    final result = await db?.rawQuery('select SUM($VALUE) from $BILL');
    double total = result![0]['SUM($VALUE)'] as double;
    return total.toString();
  }

  Future printTotalIncome() async {
    final db = await instance.database;
    final result = await db?.rawQuery('select SUM($VALUE) from $BALANCE');
    double total = result![0]['SUM($VALUE)'] as double;
    return total.toString();
  }

  Future getAvrage() async {
    final db = await instance.database;
    final _result = await db?.rawQuery('SELECT AVG($VALUE) from $BILL');
    avg = _result![0]['AVG($VALUE)'].toString();
  }

  getBillsTotal() async {
    bill = await printTotalBills();
  }

  getTotalBalance() async {
    balance = await getBalance();
  }
}
