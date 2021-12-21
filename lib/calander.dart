import 'package:flutter/material.dart';
class Calander extends StatelessWidget {
  final String name;
  Calander(this.name);
  @override
  Widget build(BuildContext context) {
     return ElevatedButton(onPressed: () async
    {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(), // Refer step 1
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      );
    },
      child: Text(name),
    );
  }

}
