// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:finance/pages/incomePage.dart';
import 'package:flutter/material.dart';

import './pages/BillsPage.dart';
import 'pages/mainpage.dart';
import 'Income.dart';
import 'bill.dart';
import 'database/db.dart';

late List<Bill> Bills;
late List<Income> Incomes;

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  void _refresh() async {
    DBhelper.instance.getAvrage();
    DBhelper.instance.getBillsTotal();
    DBhelper.instance.getTotalBalance();
  }

  @override
  void initState() {
    _refresh();
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
            appBarTheme: AppBarTheme(backgroundColor: Colors.indigo)),
        home: MyApp());
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Nav();
  }
}

class _Nav extends State<MyApp> {
  late int index = 1;
  void _onItemTapped(int _index) {
    setState(() {
      DBhelper.instance.getAvrage();
      DBhelper.instance.getBillsTotal();
      DBhelper.instance.getTotalBalance();
      index = _index;
    });
  }

  late final List<Widget> _Pages = <Widget>[
    IncomePage(),
    MainPage(),
    Billpage(),
  ];
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Pages.elementAt(index),
      bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: index,
          height: 60.0,
          items: <Widget>[
            Icon(
              Icons.list_alt_sharp,
              size: 30,
            ),
            Icon(
              Icons.home,
              size: 30,
            ),
            Icon(Icons.line_style_outlined, size: 30),
          ],
          color: Colors.cyan.shade50,
          buttonBackgroundColor: Colors.blue,
          backgroundColor: Colors.indigo,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: _onItemTapped),
    );
  }
}
