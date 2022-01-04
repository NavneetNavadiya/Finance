import 'package:finance/addBill.dart';
import 'package:finance/main.dart';
import "package:flutter/material.dart";

import 'button.dart';

class Balance extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BalancePage();
  }
}

class BalancePage extends State<Balance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الرصيد"),
      ),
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
    );
  }
}
