// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database/db.dart';
import './navigation/navigation_bar.dart';

final DateFormat formatter = DateFormat('yyyy-MM');

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
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(left: 100, top: 50),
                      child: showBalance()),
                  Container(
                      padding: EdgeInsets.only(left: 100, top: 50),
                      child: Text('الرصيد')),
                  Container(
                      padding: EdgeInsets.only(left: 100, top: 50),
                      child: showAVg()),
                  Container(
                      padding: EdgeInsets.only(left: 100, top: 50),
                      child: Text('avg')),
                  Container(
                      padding: EdgeInsets.only(left: 100, top: 50),
                      child: showBillsTotal()),
                  Container(
                      padding: EdgeInsets.only(left: 100, top: 50),
                      child: Text('المصاريف')),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: const Icon(Icons.camera_alt_outlined)),
        bottomNavigationBar: Nav(2),
      ),
    );
  }

  Widget showBillsTotal() {
    DBhelper.instance.getBillsTotal();
    return Text(bill != '' ? bill : 'watting ');
  }

  Widget showBalance() {
    DBhelper.instance.getTotalBalance();
    return Text(balance != '' ? balance : 'watting ');
  }

  Widget showAVg() {
    DBhelper.instance.getAvrage();
    return Text(avg != '' ? avg : 'watting ');
  }
}
