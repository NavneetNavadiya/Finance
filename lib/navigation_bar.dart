import 'package:flutter/material.dart';


class Nav extends StatelessWidget {
  const Nav();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'setting',
    backgroundColor: Colors.blue
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.bar_chart),
    label: 'Report',
    backgroundColor: Colors.blue
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
    backgroundColor: Colors.blue
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.camera),
    label: 'Camera',
    backgroundColor: Colors.blue
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.menu),
    label: 'Menu',
    backgroundColor: Colors.blue
    ),
    ],
    ),
    );
  }
//       void _onItemTapped(int index) {
// setState(() {
// _selectedIndex = index;
// });
// }


}