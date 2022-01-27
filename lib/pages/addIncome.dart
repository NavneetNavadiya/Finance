import 'package:finance/widgets/inpuNote.dart';
import 'package:finance/widgets/inputNumber.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/button.dart';
import '../database/db.dart';
import '../Income.dart';
import '../main.dart';

late var _Textvalue = '0';
late var _note = 'NO NOTE';
late DateTime _date = DateTime.now();
var _catagorie = 'الراتب';
var items = [
  "الراتب",
  "مدخول",
  "قرض",
  "مرجوع",
];
final DateFormat formatter = DateFormat('yyyy-MM-dd');
late var input;

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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: input = inputMoney(_Textvalue)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
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
      ]),
      bottomSheet: Container(
          width: double.infinity,
          child: Button("اضافة", () async {
            _Textvalue = await input.getValue();
            late double _value = double.parse(_Textvalue);
            late String _formatted = formatter.format(_date);
            Income income = Income(
              id: 1,
              date: _formatted,
              amount: _value,
              type: _catagorie,
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
