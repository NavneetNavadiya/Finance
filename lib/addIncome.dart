import 'package:flutter/material.dart';

import './calender.dart';
import './button.dart';
import 'database/db.dart';

class addIncome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return page();
  }
}

class page extends State<addIncome> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("اضافة مدخول"),
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
        ],
      ),
      bottomSheet: Container(
          width: double.infinity,
          child: Button("اضافة", () {
            print("success");
            Navigator.pop(context);
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
