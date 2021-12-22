import 'package:flutter/material.dart';
class Calender extends StatelessWidget {

  Calender();
  @override
  Widget build(BuildContext context) {
     return TextButton(
       style: ButtonStyle(


     ),
       child:Icon(Icons.calendar_today),
       onPressed: () async
    {

      showDatePicker(
        context: context,
        initialDate: DateTime.now(), // Refer step 1
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      );
    },

    );
  }

}
