import 'package:flutter/material.dart';
class Img extends StatelessWidget {
  final String path;
  var function;
  Img(this.path, this.function);
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed:function,
        icon: Image.asset(path),
        iconSize: 50,

    );

  }

}
