
import 'package:flutter/material.dart';

import './button.dart';
import './calender.dart';
import './navigation_bar.dart';
import './Spending.dart';
import 'Imag.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Finance',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(title: Text("Finance")),
            body:
             MyAppState(),
bottomNavigationBar: Nav(),


    ),
    );
  }

  }
_nave(BuildContext context, Widget page)
{

}

  // This widget is the root of your application.
 class MyAppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home:
      Scaffold(
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
                    color: Colors.green,
                    child: Column(children: <Widget>[
                      Img("./icon/IconSpend.png",(){
                        Navigator.push(context,
                            MaterialPageRoute(builder:(context)=> Spending()));
                      }
                      ),
                      Text("المصاريف",
                        style:TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight. bold,
                      ),
                          ),
                    ],
                    )

                  ),
                  Container(
                    child: Button ("تقارير",null),
                  ),

                  Container(
                    child: Button("الرصيد",null),
                  ),

                ],
              ),

      ),
    );
  }


}