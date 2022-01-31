// ignore_for_file: constant_identifier_names, import_of_legacy_library_into_null_safe

import 'dart:async';

import 'package:finance/bill.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../bill.dart';
import '../Income.dart';

late var bill = '0.0';
late var income = '0.0';
late var balance = '0.0';
late var lasttransaction = '0.0';
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
    double value = bill.getValue() * -1;
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
    // var balanceResult = await db
    //     ?.rawQuery('SELECT $VALUE FROM $BALANCE ORDER BY $ID DESC LIMIT 1');
    // double _balance = balanceResult![0][VALUE] as double;
    var qincome = await db?.rawQuery('SELECT SUM($VALUE) FROM $INCOME');
    var qbill = await db?.rawQuery('SELECT SUM($VALUE) FROM $BILL');
    double _income = qincome![0]['SUM($VALUE)'] as double;
    double _bill = qbill![0]['SUM($VALUE)'] as double;
    if (_bill == null) _bill = 0;
    if (_income == null) _income = 0;

    double _balance = _income + _bill;
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
    final List<Map<String, dynamic>> maps =
        await db!.query(BILL, orderBy: '$ID DESC');

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
    final List<Map<String, dynamic>> maps =
        await db!.query(INCOME, orderBy: '$ID DESC');

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
    if (result[0]['SUM($VALUE)'] != null)
      return total.round().toString();
    else {
      total = 0.0;
      return total.toString();
    }
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
    if (_result?[0]['AVG($VALUE)'] != null) {
      double value = _result![0]['AVG($VALUE)'] as double;
      int v = value.round();
      avg = v.toString();
    } else
      avg = "0.0";
  }

  getBillsTotal() async {
    bill = await printTotalBills();
  }

  getTotalBalance() async {
    balance = await getBalance();
  }

  printlast() async {
    lasttransaction = await getLastTransaction();
  }

  getOther() async {
    final db = await instance.database;
    final _result = await db
        ?.rawQuery('SELECT SUM($VALUE) FROM $BILL WHERE TYPE =?', ['اخرى']);
    double total = _result![0]['SUM($VALUE)'] as double;
    if (total == null) total = 0.0;
    return total;
  }

  getHouse() async {
    final db = await instance.database;
    final _result = await db
        ?.rawQuery('SELECT SUM($VALUE) FROM $BILL WHERE TYPE =?', ['المنزل']);
    double total = _result![0]['SUM($VALUE)'] as double;
    if (total == null) total = 0.0;
    return total;
  }

  getEntertainment() async {
    final db = await instance.database;
    final _result = await db
        ?.rawQuery('SELECT SUM($VALUE) FROM $BILL WHERE TYPE =?', ['الترفيه']);
    double total = _result![0]['SUM($VALUE)'] as double;
    if (total == null) total = 0.0;
    return total;
  }

  getBills() async {
    final db = await instance.database;
    final _result = await db
        ?.rawQuery('SELECT SUM($VALUE) FROM $BILL WHERE TYPE =?', ['الفواتير']);
    double total = _result![0]['SUM($VALUE)'] as double;
    if (total == null) total = 0.0;
    return total;
  }

  getHealth() async {
    final db = await instance.database;
    final _result = await db
        ?.rawQuery('SELECT SUM($VALUE) FROM $BILL WHERE TYPE =?', ['الصحة']);
    double total = _result![0]['SUM($VALUE)'] as double;
    if (total == null) total = 0.0;
    return total;
  }

  getShopping() async {
    final db = await instance.database;
    final _result = await db
        ?.rawQuery('SELECT SUM($VALUE) FROM $BILL WHERE TYPE =?', ['التسوق']);
    double total = _result![0]['SUM($VALUE)'] as double;
    if (total == null) total = 0.0;
    return total;
  }

  getCar() async {
    final db = await instance.database;
    final _result = await db
        ?.rawQuery('SELECT SUM($VALUE) FROM $BILL WHERE TYPE =?', ['السيارة']);
    double total = _result![0]['SUM($VALUE)'] as double;
    if (total == null) total = 0;

    return total;
  }

  getFood() async {
    final db = await instance.database;
    final _result = await db
        ?.rawQuery('SELECT SUM($VALUE) FROM $BILL WHERE TYPE =?', ['المطاعم']);
    double total = _result![0]['SUM($VALUE)'] as double;
    if (total == null) total = 0;

    return total;
  }

  deleteIncome(id) async {
    final db = await instance.database;
    final _result = await db?.delete(INCOME, where: 'id =?', whereArgs: [id]);
    await getBalance();
    return print('done');
  }

  deleteBill(id) async {
    final db = await instance.database;

    final _result = await db?.delete(BILL, where: 'id =?', whereArgs: [id]);
    return print('done');
  }

  getLastTransaction() async {
    final db = await instance.database;

    final _result = await db?.query(BILL, orderBy: '$ID DESC', limit: 1);
    double value = _result![0]["$VALUE"] as double;
    return value.toString();
  }
}
/* 
house 
other 
education 
food 
gerocery
health
shoping 
phone 
 */