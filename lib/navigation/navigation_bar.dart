// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:finance/pages/incomePage.dart';
// import 'package:flutter/material.dart';

// import '../pages/addBill.dart';
// import '../pages/addIncome.dart';
// import '../pages/BillsPage.dart';
// import '../main.dart';

// class Nav extends StatelessWidget {
//   int number;
//   Nav(this.number);
//   GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: CurvedNavigationBar(
//         key: _bottomNavigationKey,
//         index: number,
//         height: 60.0,
//         items: <Widget>[
//           Icon(
//             Icons.add_circle_outline,
//             size: 30,
//             color: Colors.black,
//           ),
//           Icon(
//             Icons.list_alt_sharp,
//             size: 30,
//           ),
//           Icon(
//             Icons.home,
//             size: 30,
//             semanticLabel: 'Home',
//           ),
//           Icon(Icons.line_style_outlined, size: 30),
//           Icon(Icons.remove_circle_outline_sharp,
//               size: 30, color: Colors.black),
//         ],
//         color: Colors.cyan.shade50,
//         buttonBackgroundColor: Colors.blue,
//         backgroundColor: Colors.indigo,
//         animationCurve: Curves.easeInOut,
//         animationDuration: Duration(milliseconds: 600),
//         onTap: (index) {
//           if (index == 0) {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => addIncome()));
//           }
//           if (index == 1) {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => IncomePage()));
//           }
//           if (index == 2) {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => MyApp()));
//           }
//           if (index == 3) {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => Billpage()));
//           }

//           if (index == 4) {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => addBill()));
//           }
//         },
//         letIndexChange: (index) => true,
//       ),
//     );
//   }
// }
