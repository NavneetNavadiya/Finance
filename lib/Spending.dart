import 'package:flutter/material.dart';

import './calender.dart';
import './button.dart';
import './calender.dart';
import './navigation_bar.dart';

class Spending extends StatelessWidget{

  var items =[
    'item 1',
    'item 2',
    'item 3',
    'item 4'
  ];
  var select = "select";
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      title: "Spending",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("المصاريف"),),
        body:
       GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 8.0,
         children: <Widget>[

           Container(
             child: Text("التاريخ"),
           ),

           Container(
            child: Calender()
           ),

           Container(
             child:Text("المبلغ")
           ),

           Container(
             child:TextField(
                 keyboardType: TextInputType.number)
           ),

           Container(
             child: Text("الصنف"),
           ),



           Container(
             child: Button("اضافة",null),
           )

         ],
       )
      ),
    );

  }
  
}