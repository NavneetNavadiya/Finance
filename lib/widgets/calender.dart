import 'package:flutter/material.dart';

class Calender extends StatelessWidget {
  DateTime _date;
  Calender(this._date);

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
    );
  }
}
