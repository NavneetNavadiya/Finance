import 'package:flutter/material.dart';

import './navigation_bar.dart';
import 'database/db.dart';
import 'addIncome.dart';

class IncomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المدخول"),
      ),
      body: ListView(
        addAutomaticKeepAlives: true,
        children: <Widget>[],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => addIncome()),
            );
          },
          child: const Icon(Icons.add)),
      bottomNavigationBar: Nav(),
    );
  }
}
