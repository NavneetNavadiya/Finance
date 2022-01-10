// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './navigation/navigation_bar.dart';

import 'database/db.dart';
import 'Income.dart';
import 'bill.dart';

final DateFormat formatter = DateFormat('yyyy-MM');
var _isLoading = false;
late List<Bill> Bills;
late List<Income> Incomes;
void main() {
  runApp(MaterialApp(home: MyApp()));
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
      theme: ThemeData(primaryColor: Colors.amber),
      home: Scaffold(
        appBar: AppBar(title: Text("home")),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(formatter.format(DateTime.now()).toString()),
            ),
            Expanded(
                child: _isLoading
                    ? CircularProgressIndicator()
                    : Bills.isEmpty || Incomes.isEmpty
                        ? const Text(
                            "there no data on about your income or bills pleas add them to create an analysis")
                        : buildpage())
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: const Icon(Icons.camera_alt_outlined)),
        bottomNavigationBar: Nav(2),
      ),
    );
  }

  Widget buildpage() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 8.0,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 100, top: 50), child: showBalance()),
        Container(
            padding: EdgeInsets.only(left: 100, top: 50),
            child: Text('الرصيد')),
        Container(
            padding: EdgeInsets.only(left: 100, top: 50), child: showAVg()),
        Container(
            padding: EdgeInsets.only(left: 100, top: 50), child: Text('avg')),
        Container(
            padding: EdgeInsets.only(left: 100, top: 50),
            child: showBillsTotal()),
        Container(
            padding: EdgeInsets.only(left: 100, top: 50),
            child: Text('المصاريف')),
      ],
    );
  }

  Widget showBillsTotal() {
    return Text(bill != '' ? bill : 'no data ');
  }

  Widget showBalance() {
    return Text(balance != '' ? balance : 'no data ');
  }

  Widget showAVg() {
    return Text(avg != '' ? avg : 'no data ');
  }
}
