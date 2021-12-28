import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String _name;
  var _function;
  Button(this._name, this._function);
  @override
  Widget build(BuildContext context) {
    return Ink(
        child: ElevatedButton(
      onPressed: _function,
      child: Text(_name),
      style: ButtonStyle(),
    ));
  }
}
