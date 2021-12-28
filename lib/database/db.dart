// import 'dart:async';
// import 'dart:convert';
//
// import 'package:finance/spend.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import '../SpendingPage.dart';
//
// class DBhelper {
//   static const String COLUMN_ID = "id";
//   static const String COLUMN_DATE = 'date';
//   static const String COLUMN_VALUE = 'value';
//   static const String COLUMN_TYPE = 'type';
//
//   DBhelper._();
//
//   DBhelper db = DBhelper._();
//
//   late Database _database;
//
//   Future<Database> get database async {
//     if (_database != null) {
//       return _database;
//     }
//     _database = await createDatabase();
//     return _database;
//   }
//
//   Future<Database> createDatabase() async {
//     String dbPath = await getDatabasesPath();
//     return await openDatabase(join(dbPath, 'data.db'), version: 1,
//         onCreate: (Database database, int version) async {
//       print("database has been created");
//
//        await database.execute(
//           'CREATE TABLE Spend ($COLUMN_ID INTEGER PRIMARY KEY, $COLUMN_DATE DATE, $COLUMN_VALUE DOUBLE, $COLUMN_TYPE TEXT)');
//     });
//
//   }
//
//   static Future<void> insert(String table, Map<String, Object>data)async {
//
//   }
// }
