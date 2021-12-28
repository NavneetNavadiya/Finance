import 'package:flutter/material.dart';

class Img extends StatelessWidget {
  final String _path;
  var _function;
  Img(this._path, this._function);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: IconButton(
      onPressed: _function,
      icon: Image.asset(_path),
      iconSize: 130,
    ));
  }
}
