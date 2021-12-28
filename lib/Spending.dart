import 'package:flutter/material.dart';

import './calender.dart';
import './button.dart';
import './calender.dart';
import './navigation_bar.dart';

class Spending extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(title: Text("المصاريف"),),
        body:
       GridView.count(
          crossAxisCount: 2,
          childAspectRatio: .99,

          crossAxisSpacing: 20.0,
          mainAxisSpacing: 1.0,

          children: <Widget>[

           Container(
              padding: EdgeInsets.only(bottom: 50),
               child: Calender()
           ),

           Container(
             padding: EdgeInsets.only(left: 100,top: 50),
             child: Text("التاريخ"),
           ),

           Container(
               padding: EdgeInsets.only(left: 50),
             child:TextField(
                 keyboardType: TextInputType.number)
           ),

           Container(
               padding: EdgeInsets.only(left: 100),
               child:Text("المبلغ")
           ),

           Container(
             padding: EdgeInsets.only(bottom: 100,left: 50),
             child: DropdownButton(onChanged: null, items: [],),
           ),

           Container(
             padding: EdgeInsets.only(left: 100),
             child: Text("الصنف"),
           ),

         ],
       ),
       bottomSheet:
       Container (
         width: double.infinity,
           child:
            Button("اضافة",(){
              print("sucess");
            })
       ),
      bottomNavigationBar: Nav(),
      );

  }
  
}