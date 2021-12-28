import 'package:flutter/material.dart';
class Button extends StatelessWidget {
<<<<<<< HEAD
  final String _name;
  var _function;
  Button(this._name, this._function);
  @override
  Widget build(BuildContext context) {
    return Ink(
      child:ElevatedButton(onPressed:_function,
      child: Text(_name),
=======
  final String name;
  var function;
  Button(this.name, this.function);
  @override
  Widget build(BuildContext context) {
    return Ink(
      child:ElevatedButton(onPressed:function,
      child: Text(name),
>>>>>>> 60d0d61919c302dbe610ff1c7958533884974bd0
      style: ButtonStyle(

      ),
    )
    );

  }

}
