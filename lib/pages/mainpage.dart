// ignore_for_file: unnecessary_new, prefer_const_constructors, unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../database/db.dart';
import '../Income.dart';
import '../bill.dart';
import '../widgets/Credit card.dart';
import '../widgets/text.dart';

final DateFormat formatter = DateFormat('yyyy-MM');
var _isLoading = false;
late List<Bill> Bills;
late List<Income> Incomes;

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

  @override
  void initState() {
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home")),
      body: Column(
        children: [
          Container(child: Credit(balance)),
          Expanded(
            child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: .99,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 1.0,
                children: <Widget>[
                  Column(
                    //data of analysis
                    children: [
                      text('average of sepnd:' + avg),
                      text('total sepnd:' + bill),
                      text('balance: ' + balance)
                    ],
                  ) //data of analysis
                ]),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: const Icon(Icons.camera_alt_outlined)),
    );
  }
}
