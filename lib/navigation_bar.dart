import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
=======


>>>>>>> 60d0d61919c302dbe610ff1c7958533884974bd0
class Nav extends StatelessWidget {
  const Nav();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
<<<<<<< HEAD
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
        // onTap: (value) {
        //        if(value == 4)
        //         {
        //           print("the camera icon has been click");
        //           // WidgetsFlutterBinding.ensureInitialized();
        //           // cameras = await availableCameras();
        //           // Navigator.of(context).push(MaterialPageRoute(
        //           //     builder: (context) => CameraApp())
        //           //);
        //         }
        // },
      ),
    );
  }
}
=======
      BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
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
}
>>>>>>> 60d0d61919c302dbe610ff1c7958533884974bd0
