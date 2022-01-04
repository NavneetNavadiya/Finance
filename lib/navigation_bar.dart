import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:finance/incomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:finance/addBill.dart';
import 'package:finance/addIncome.dart';
import 'package:finance/bill.dart';
import 'BillsPage.dart';
import 'balancePage.dart';
import 'main.dart';

class Nav extends StatelessWidget {
  int number;
  Nav(this.number);
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: number,
        height: 60.0,
        items: <Widget>[
          Icon(
            Icons.add_circle_outline,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.list_alt_sharp,
            size: 30,
          ),
          Icon(
            Icons.home,
            size: 30,
            semanticLabel: 'Home',
          ),
          Icon(Icons.line_style_outlined, size: 30),
          Icon(Icons.camera_outlined, size: 30),
          Icon(Icons.remove_circle_outline_sharp,
              size: 30, color: Colors.black),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.blue,
        backgroundColor: Colors.blueGrey,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new addIncome()));
          }
          if (index == 1) {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new IncomePage()));
          }
          if (index == 2) {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new MyApp()));
          }
          if (index == 3) {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new Billpage()));
          }

          if (index == 5) {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new addBill()));
          }
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
