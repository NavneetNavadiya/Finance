// ignore_for_file: unnecessary_new

import 'package:finance/circual%20button.dart';
import 'package:finance/incomePage.dart';
import 'package:finance/bill.dart';
import 'package:flutter/material.dart';

import './button.dart';
import './navigation_bar.dart';
import 'BillsPage.dart';
import 'balancePage.dart';

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
              child: Text(DateTime.now().toString()),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(left: 100, top: 50),
                      child: Text("654156")),
                  Container(
                      padding: EdgeInsets.only(left: 100, top: 50),
                      child: Text('الرصيد')),
                  Container(
                      padding: EdgeInsets.only(left: 100, top: 50),
                      child: Text('')),
                  Container(
                      padding: EdgeInsets.only(left: 100, top: 50),
                      child: Text('اجمالي الرصيد')),
                  Container(
                      padding: EdgeInsets.only(left: 100, top: 50),
                      child: Text('')),
                  Container(
                      padding: EdgeInsets.only(left: 100, top: 50),
                      child: Text('المصاريف')),
                  Container(
                      padding: EdgeInsets.only(left: 100, top: 50),
                      child: Text('')),
                  Container(
                    padding: EdgeInsets.only(left: 100, top: 50),
                    child: Text('الرصيد'),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Nav(2),
      ),
    );
  }
}
