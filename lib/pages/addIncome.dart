import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../widgets/button.dart';
import '../database/db.dart';
import '../Income.dart';
import '../main.dart';

late var _Textvalue = '0';
late var _note = 'NO NOTE';
late DateTime _date = DateTime.now();
final DateFormat formatter = DateFormat('yyyy-MM-dd');

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
      body: Column(children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
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
                        _date = selectDate!;
                      });
                    },
                    icon: Icon(Icons.calendar_today)),
                Text(formatter.format(_date))
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: DropdownButton(
            onChanged: null,
            items: [],
          ),
        ),
      ]),
      bottomSheet: Container(
          width: double.infinity,
          child: Button("اضافة", () async {
            late double _value = double.parse(_Textvalue);
            late String _formatted = formatter.format(_date);
            Income income = Income(
              id: 1,
              date: _formatted,
              amount: _value,
              type: 'salary',
            );
            await DBhelper.instance.insertIcome(income);
            Incomes = (await DBhelper.instance.PrintIncomes());
            await DBhelper.instance.getTotalBalance();
            await DBhelper.instance.getAvrage();
            print("success");
            Navigator.pop(context);
          })),
    );
  }
}
