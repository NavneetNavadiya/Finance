import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  final String name;
  var function;
  Button(this.name, this.function);
  @override
  Widget build(BuildContext context) {
    return Ink(
      child:ElevatedButton(onPressed:function,
      child: Text(name),
      style: ButtonStyle(

      ),
    )
    );

  }

}
