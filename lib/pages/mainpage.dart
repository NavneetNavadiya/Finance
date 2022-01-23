// ignore_for_file: unnecessary_new, prefer_const_constructors, unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../database/db.dart';
import '../Income.dart';
import '../bill.dart';
import '../widgets/Credit card.dart';
import '../widgets/text.dart';
import '../widgets/Graph.dart';

final DateFormat formatter = DateFormat('yyyy-MM');
var _isLoading = false;
late List<Bill> Bills;
late List<Income> Incomes;
late Map<String, double> data;

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _page();
  }
}

// This widget is the root of your application.
class _page extends State<MainPage> {
  _refresh() async {
    await DBhelper.instance.getAvrage();
    await DBhelper.instance.getBillsTotal();
    await DBhelper.instance.getTotalBalance();
  }

  getAnalysis() async {
    data = {
      "بيت": await DBhelper.instance.getHouse(),
      "التعليم": await DBhelper.instance.getEducation(),
      "غذاء": await DBhelper.instance.getFood(),
      "بقالة": await DBhelper.instance.getGrocery(),
      'الصحة': await DBhelper.instance.getHealth(),
      'التسوق': await DBhelper.instance.getShopping(),
      'هاتف': await DBhelper.instance.getPhone(),
      'آخر': await DBhelper.instance.getOther()
    };
  }

  @override
  void initState() {
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الصفحة الرئيسية")),
      body: Column(
        children: [
          Container(
              child: FutureBuilder(
                  future: DBhelper.instance.getTotalBalance(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // do not change this text
                      print("snapshot.data -> ");
                      print(snapshot.data);
                    }
                    return Credit(balance);
                  })),
          Expanded(
            child: Column(children: <Widget>[
              FutureBuilder(
                  future: DBhelper.instance.getTotalBalance(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // do not change this text
                      print("snapshot.data -> ");
                      print(snapshot.data);
                    }
                    return text('مجوع الصرف:' + bill);
                  }),
              FutureBuilder(
                  future: DBhelper.instance.getAvrage(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // do not change this text
                      print("snapshot.data -> ");
                      print(snapshot.data);
                    }
                    return text('متوسط الصرف: ' + avg);
                  }),
              FutureBuilder(
                  future: getAnalysis(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // do not change this text
                      print("snapshot.data -> ");
                      print(snapshot.data);
                    }
                    return Container(
                        width: double.infinity, child: Analysis(data));
                  }),
            ]),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: const Icon(Icons.camera_alt_outlined)),
    );
  }
}
