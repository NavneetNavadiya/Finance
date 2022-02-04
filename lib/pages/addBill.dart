import 'package:finance/bill.dart';
import 'package:finance/pages/mainpage.dart' as stream;
import 'package:finance/widgets/inpuNote.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../widgets/button.dart';
import '../database/db.dart';
import '../main.dart';

class addBill extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return addBillpage();
  }
}

class addBillpage extends State<addBill> {
  //String catagories = 'اختارنوع المصروف';
  late var _Textvalue = '0';
  late var _note = 'NO NOTE';
  late DateTime _date = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  late var input;
  late var Note;
  var _catagorie = 'المنزل';
  var items = [
    "المنزل",
    "الفواتير",
    "المطاعم",
    "الترفيه",
    'الصحة',
    'التسوق',
    'السيارة',
    'اخرى'
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("اضافة مصروف"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        ).then((selectDate) {
                          setState(() {
                            _date = selectDate!;
                          });
                        });
                      },
                      icon: Icon(Icons.calendar_today)),
                  Text(formatter.format(_date))
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: TextFormField(
              style: TextStyle(
                fontSize: 30.0,
                height: 2.0,
              ),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'مبلغ',
                  labelText: 'المبلغ',
                  suffixIcon: Icon(Icons.money)),
              keyboardType: TextInputType.phone,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
              ],
              onChanged: (text) {
                _Textvalue = text;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: DropdownButton(
              value: _catagorie,
              icon: Icon(Icons.arrow_downward),
              items: items.map((String a) {
                return DropdownMenuItem<String>(
                  value: a,
                  child: Text(a),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _catagorie = newValue!;
                });
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Note = inputNote(_note))
        ],
      ),
      bottomSheet: Container(
          width: double.infinity,
          child: Button("اضافة", () async {
            _note = await Note.getNote();
            late double _value = double.parse(_Textvalue);
            late String _formatted = formatter.format(_date);
            Bill _bill = Bill(
                id: 1,
                date: _formatted,
                value: _value,
                type: _catagorie,
                note: _note);
            await DBhelper.instance.insertBill(_bill);
            DBhelper.instance.getBillsTotal();
            DBhelper.instance.getTotalBalance();
            DBhelper.instance.getAvrage();
            Bills = (await DBhelper.instance.PrintBills());
            stream.analysisControlller.sink.add(true);
            print("success");
            Navigator.pop(context, balance);
          })),
    );
  }
}
