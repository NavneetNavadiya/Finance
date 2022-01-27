// ignore_for_file: unnecessary_new, prefer_const_constructors, unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../database/db.dart';
import '../Income.dart';
import '../bill.dart';
import '../widgets/Credit card.dart';
import '../widgets/text.dart';
import '../widgets/Graph.dart';
import 'camera.dart';

final DateFormat formatter = DateFormat('yyyy-MM');
var _isLoading = false;
late List<Bill> Bills;
late List<Income> Incomes;
late Map<String, double> data;
double house = 0;
double food = 0;
double Entertainment = 0;
double bills = 0;
double health = 0;
double shopping = 0;
double car = 0;
double other = 0;

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
      "المنزل": await DBhelper.instance.getHouse() * -1,
      "الترفيه": await DBhelper.instance.getEntertainment() * -1,
      "المطاعم": await DBhelper.instance.getFood() * -1,
      "الفواتير": await DBhelper.instance.getBills() * -1,
      'الصحة': await DBhelper.instance.getHealth() * -1,
      'التسوق': await DBhelper.instance.getShopping() * -1,
      'السيارة': await DBhelper.instance.getCar() * -1,
      'اخرى': await DBhelper.instance.getOther() * -1
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
                    return text('مجموع الصرف:' + bill);
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
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => camera()),
            );
          },
          child: const Icon(Icons.camera_alt_outlined)),
    );
  }
}
