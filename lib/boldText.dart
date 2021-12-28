import 'package:flutter/material.dart';

class Boldtext extends StatelessWidget {
  final String text;
  Boldtext(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
    throw UnimplementedError();
  }
}
