import 'dart:io';

import 'package:flutter/material.dart';

class PhotoviewPage extends StatefulWidget {
  final File? img;

  const PhotoviewPage({Key? key, this.img}) : super(key: key);

  @override
  _PhotoviewPageState createState() => _PhotoviewPageState();
}

class _PhotoviewPageState extends State<PhotoviewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.file(widget.img!)),
      ),
    );
  }
}
