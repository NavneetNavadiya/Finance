import 'package:finance/bill.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../widgets/button.dart';
import '../database/db.dart';

class addBill extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return page();
  }
}

class page extends State<addBill> {
  String catagories = 'اختارنوع المصروف';
  late var _Textvalue = '0';
  late var _note = 'NO NOTE';
  late DateTime _date;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
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
          Container(
              padding: EdgeInsets.only(bottom: 50),
              child: TextButton(
                style: ButtonStyle(),
                child: Icon(Icons.calendar_today),
                onPressed: () async {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  ).then((selectDate) {
                    _date = selectDate!;
                  });
                },
              )),
          Container(
            padding: EdgeInsets.only(left: 100, top: 50),
            child: Text("التاريخ"),
          ),
          Container(
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (text) {
                _Textvalue = text;
              },
            ),
          ),
          Container(padding: EdgeInsets.only(left: 100), child: Text("المبلغ")),
          Container(
              padding: EdgeInsets.only(bottom: 100),
              child: DropdownButton(onChanged: null, items: [])),
          Container(
            padding: EdgeInsets.only(left: 100),
            child: Text("الصنف"),
          ),
          Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 0, top: 50),
                  width: double.infinity,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    onChanged: (text) {
                      _note = text;
                    },
                  ))
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
            late double _value = double.parse(_Textvalue);
            late String _formatted = formatter.format(_date);
            Bill bill = Bill(
                id: 1,
                date: _formatted,
                value: _value,
                type: 'car',
                note: _note);
            await DBhelper.instance.insertBill(bill);
            Bills = (await DBhelper.instance.PrintBills());
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
