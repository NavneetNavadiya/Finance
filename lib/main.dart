// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:finance/pages/incomePage.dart';
import 'package:flutter/material.dart';

import './pages/BillsPage.dart';
import 'pages/mainpage.dart';
import 'Income.dart';
import 'bill.dart';
import 'database/db.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

late List<Bill> Bills;
late List<Income> Incomes;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(app());
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: <Locale>[
        Locale('ar'),
      ],
      locale: Locale('ar'),
      title: "Finance",
      theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.blueGrey[50],
          appBarTheme: AppBarTheme(backgroundColor: Colors.indigo)),
      home: MyApp(),
    );
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
          color: Colors.white,
          buttonBackgroundColor: Colors.blue,
          backgroundColor: Colors.indigo,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: _onItemTapped),
    );
  }
}
