import 'package:finance/circual%20button.dart';
import 'package:finance/incomePage.dart';
import 'package:flutter/material.dart';

import './button.dart';
import './navigation_bar.dart';
import 'SpendingPage.dart';
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
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text("home")),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 8.0,
          children: <Widget>[
<<<<<<< HEAD

            CButton("المدخول", Colors.amberAccent, "", (){
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => new IncomePage())
              );
            }),

            CButton("المصاريف",Colors.blue, "",() {
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => new SpendingPage())
              );
            }
            ),

            Container(
              child: Button("تقارير", null),
            ),
            CButton("الرصيد", Colors.red,"icon/IconSpend.png",() {
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => new Balance())
              );}
            ),

=======
            CButton("المدخول", Colors.amberAccent, "", () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new IncomePage()));
            }),
            CButton("المصاريف", Colors.blue, "", () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new SpendingPage()));
            }),
            Container(
              child: Button("تقارير", null),
            ),
            CButton("الرصيد", Colors.red, "icon/IconSpend.png", () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Balance()));
            }),
>>>>>>> 60d0d61919c302dbe610ff1c7958533884974bd0
          ],
        ),
        bottomNavigationBar: Nav(),
      ),
<<<<<<< HEAD

=======
>>>>>>> 60d0d61919c302dbe610ff1c7958533884974bd0
    );
  }
}
