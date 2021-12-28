import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'camera.dart';

class Nav extends StatelessWidget {
  const Nav();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Report',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
              backgroundColor: Colors.blue),
        ],
        // onTap: (value) async {
        //   if (value == 4) {
        //     print("the camera icon has been click");
        //     WidgetsFlutterBinding.ensureInitialized();
        //     camera = (await availableCameras()) as CameraDescription;
        //     Navigator.of(context)
        //         .push(MaterialPageRoute(builder: (context) => camera()));
        //   }
        // },
      ),
    );
  }
}
