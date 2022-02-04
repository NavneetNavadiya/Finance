import 'dart:io';
import 'package:finance/pages/photoView.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class GAlleryScreen extends StatefulWidget {
  const GAlleryScreen({Key? key}) : super(key: key);

  @override
  _GAlleryScreenState createState() => _GAlleryScreenState();
}

class _GAlleryScreenState extends State<GAlleryScreen> {
  Future? _futureGetPath;
  List<dynamic> listImagePath = [];
  var _permissionStatus;
  var dir;

  @override
  void initState() {
    // TODO: implement initState
    _listenForPermissionStatus();
    _futureGetPath = _getPath();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gallery'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: FutureBuilder(
                future: _futureGetPath,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    dir = Directory(snapshot.data);
                    if (_permissionStatus) _fetchFiles(dir);
                    return Text('');
                  } else {
                    return Text("Loading");
                  }
                },
              ),
            ),
            Expanded(
              flex: 19,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: _getListImg(listImagePath),
              ),
            )
          ],
        ));
  }

  void _listenForPermissionStatus() async {
    final status = await Permission.storage.request().isGranted;
    setState(() => _permissionStatus = status);
  }

  Future<String> _getPath() async {
    String externalPath = '';
    await getExternalStorageDirectory()
        .then((value) => externalPath = value!.absolute.path + '/Pictures/');
    return externalPath;
  }

  _fetchFiles(Directory dir) {
    List<dynamic>? listImage = [];
    dir.list().forEach((element) {
      RegExp regExp =
          RegExp("\.(gif|jpe?g|tiff?|png|webp|bmp)", caseSensitive: false);

      if (regExp.hasMatch('$element')) listImage.add(element);
      setState(() {
        listImagePath = listImage;
      });
    });
  }

  Future<void> deleteFile(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      // Error in getting access to the file.
    }
  }

  List<Widget> _getListImg(List<dynamic> listImagePath) {
    List<Widget> listImages = [];
    for (var imagePath in listImagePath) {
      listImages.add(Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoviewPage(
                      img: imagePath,
                    ),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 5.0,
                      offset: Offset(0.0, 5.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: FileImage(imagePath), fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            right: 5,
            top: 10,
            child: InkWell(
              onTap: () {
                deleteFile(imagePath);
                setState(() {});
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 20,
              ),
            ),
          )
        ],
      ));
    }
    return listImages;
  }
}
