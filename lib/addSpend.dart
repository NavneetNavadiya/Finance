import 'package:finance/main.dart';
import 'package:finance/spend.dart';
import 'package:flutter/material.dart';

import './calender.dart';
import './button.dart';
import 'database/db.dart';
import 'SpendingPage.dart';

class addSpend extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return page();
  }
}

class page extends State<addSpend> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("اضافة مصروف"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .99,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 1.0,
        children: <Widget>[
          Container(padding: EdgeInsets.only(bottom: 50), child: Calender()),
          Container(
            padding: EdgeInsets.only(left: 100, top: 50),
            child: Text("التاريخ"),
          ),
          Container(
            child: TextField(keyboardType: TextInputType.number),
          ),
          Container(padding: EdgeInsets.only(left: 100), child: Text("المبلغ")),
          Container(
            padding: EdgeInsets.only(bottom: 100),
            child: DropdownButton(
              onChanged: null,
              items: [],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 100),
            child: Text("الصنف"),
          ),
          Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 0, top: 50),
                  width: double.infinity,
                  child: TextField(keyboardType: TextInputType.multiline))
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 100, top: 50),
            child: Text("ملاحضة"),
          ),
        ],
      ),
      bottomSheet: Container(
          width: double.infinity,
          child: Button("اضافة", () async {
            Spend spend = new Spend(
                id: 1, date: 'DateTime.now()', value: 100, type: 'car');
            await DBhelper.instance.insertSpend(spend);

            print(await DBhelper.instance.PrintAll());
            print("success");

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          })),
    );
  }
}

class textController extends State {
  TextEditingController TC = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
