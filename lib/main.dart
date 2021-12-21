
import 'package:flutter/material.dart';

import './button.dart';
import './calander.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

  // This widget is the root of your application.
 class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:
      Scaffold(
      appBar: AppBar(title: Text("Finance")),
      body:


        Column(children: <Widget>[
          Container(
             child:
               Button("مدخول",null),

          ),
          Container(
            child: Button("المصروف",null),
          ),

        Container(
          child: Button ("قارير",null),

        ),

        Container(
          child: Button("الرصيد",null),

        ),

      ],
      ),

      )
    );
  }


}