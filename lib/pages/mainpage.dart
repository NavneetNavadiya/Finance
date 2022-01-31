// ignore_for_file: unnecessary_new, prefer_const_constructors, unnecessary_string_escapes

import 'dart:io';
import 'package:finance/widgets/cardv2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../database/db.dart';
import '../Income.dart';
import '../bill.dart';
import '../widgets/Credit card.dart';
import '../widgets/text.dart';
import '../widgets/Graph.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';

final DateFormat formatter = DateFormat('yyyy-MM');
var _isLoading = false;
late List<Bill> Bills;
late List<Income> Incomes;
late Map<String, double> data;

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _page();
  }
}

// This widget is the root of your application.
class _page extends State<MainPage> {
  var _image;
  Future getImage(ImgSource source) async {
    var image = await ImagePickerGC.pickImage(
      enableCloseButton: true,
      closeIcon: Icon(
        Icons.close,
        color: Colors.red,
        size: 12,
      ),
      context: context,
      source: source,
      barrierDismissible: true,
    );
    setState() {
      _image = image;
    }
  }

  _refresh() async {
    await DBhelper.instance.getAvrage();
    await DBhelper.instance.getBillsTotal();
    await DBhelper.instance.getTotalBalance();
    await DBhelper.instance.printlast();
  }

  getAnalysis() async {
    data = {
      "المنزل": await DBhelper.instance.getHouse() * -1,
      "الترفيه": await DBhelper.instance.getEntertainment() * -1,
      "المطاعم": await DBhelper.instance.getFood() * -1,
      "الفواتير": await DBhelper.instance.getBills() * -1,
      'الصحة': await DBhelper.instance.getHealth() * -1,
      'التسوق': await DBhelper.instance.getShopping() * -1,
      'السيارة': await DBhelper.instance.getCar() * -1,
      'اخرى': await DBhelper.instance.getOther() * -1
    };
  }

  @override
  void initState() {
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الصفحة الرئيسية")),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: FutureBuilder(
                  future: _refresh(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // do not change this text
                      print("snapshot.data -> ");
                      print(snapshot.data);
                    }
                    return Creditv2(balance, lasttransaction, bill);
                  })),
          Expanded(
            child: Column(children: <Widget>[
              FutureBuilder(
                  future: DBhelper.instance.getAvrage(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // do not change this text
                      print("snapshot.data -> ");
                      print(snapshot.data);
                    }
                    return text('متوسط الصرف: ' + avg);
                  }),
              FutureBuilder(
                  future: getAnalysis(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // do not change this text
                      print("snapshot.data -> ");
                      print(snapshot.data);
                    }
                    return Container(
                        width: double.infinity, child: Analysis(data));
                  }),
            ]),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await getImage(ImgSource.Camera);
            Directory appDocDir = await getApplicationSupportDirectory();
            String appDocPath = appDocDir.path;
            final File localImage = await _image.copy('$appDocPath/image.png');
          },
          child: const Icon(Icons.camera_alt_outlined)),
    );
  }
}
