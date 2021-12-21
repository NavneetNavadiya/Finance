import 'package:flutter/material.dart';

class Spending extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    MaterialApp(
      title: "Spending",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("المصاريف"),),
        body:
        Column(children: <Widget>[
          Container(
            child:

          ),
        ],
        ),
      ),
    );
    throw UnimplementedError();
  }
  
}