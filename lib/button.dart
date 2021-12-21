import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  final String name;
  var function;
  var icon;
  Button(this.name, this.function);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed:function, child: Text(name));

  }

}
