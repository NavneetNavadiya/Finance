import 'package:flutter/material.dart';
class Img extends StatelessWidget {
<<<<<<< HEAD
  final String _path;
  var  _function;
  Img(this._path, this._function);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child:IconButton(
          onPressed:_function,
          icon: Image.asset(_path),
          iconSize: 130,
=======
  final String path;
  var function;
  Img(this.path, this.function);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child:IconButton(
        onPressed:function,
        icon: Image.asset(path),
        iconSize: 130,

>>>>>>> 60d0d61919c302dbe610ff1c7958533884974bd0
    )

    );

  }

}
