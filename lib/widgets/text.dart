import 'package:flutter/material.dart';

class text extends StatelessWidget {
  late String words;
  text(this.words);
  @override
  Widget build(BuildContext context) {
    return Text(
      words,
      textAlign: TextAlign.right,
      style: TextStyle(),
    );
  }
}
