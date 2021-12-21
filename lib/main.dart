
import 'package:flutter/material.dart';

import './button.dart';
import './calender.dart';
import './navigation_bar.dart';

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
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: <Widget>[
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
      bottomNavigationBar: Nav(),
      ),
    );
  }


}