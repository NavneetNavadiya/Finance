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
<<<<<<< HEAD

=======
>>>>>>> 60d0d61919c302dbe610ff1c7958533884974bd0
      ),
    );
    throw UnimplementedError();
  }
}
