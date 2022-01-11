// ignore_for_file: unnecessary_new, prefer_const_constructors, unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './navigation/navigation_bar.dart';

import 'database/db.dart';
import 'Income.dart';
import 'bill.dart';
import './widgets/Credit card.dart';

final DateFormat formatter = DateFormat('yyyy-MM');
var _isLoading = false;
late List<Bill> Bills;
late List<Income> Incomes;
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

// This widget is the root of your application.
class MyAppState extends State<MyApp> {
  Future refreshMainPage() async {
    setState(() => _isLoading = true);

    Incomes = await DBhelper.instance.PrintIncomes();
    Bills = await DBhelper.instance.PrintBills();
    await DBhelper.instance.getBillsTotal();
    await DBhelper.instance.getTotalBalance();
    await DBhelper.instance.getAvrage();

    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    refreshMainPage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Finance",
      theme: ThemeData(
        brightness: Brightness.light,
        shadowColor: Colors.amber,
        scaffoldBackgroundColor: Colors.blueGrey[50],
        backgroundColor: Colors.amber,
        splashColor: Colors.yellow,
        // appBarTheme: AppBarTheme(backgroundColor: Color(0xFF101427))
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("home")),
        body: Container(
            child: _isLoading
                ? CircularProgressIndicator()
                : Bills.isEmpty || Incomes.isEmpty
                    ? const Text(
                        "there no data on about your income or bills pleas add them to create an analysis")
                    : Credit(balance)),
        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: const Icon(Icons.camera_alt_outlined)),
        bottomNavigationBar: Nav(2),
      ),
    );
  }

  // Widget showBillsTotal() {
  //   return Text(bill != '' ? bill : 'no data ');
  // }

  // Widget showBalance() {
  //   return Text(balance != '' ? balance : 'no data ');
  // }

  // Widget showAVg() {
  //   return Text(avg != '' ? avg : 'no data ');
  // }
}
