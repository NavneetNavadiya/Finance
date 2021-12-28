import 'package:flutter/material.dart';

import './navigation_bar.dart';
import 'database/db.dart';
import 'addSpend.dart';
import 'package:finance/addSpend.dart';

class SpendingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المصاريف"),
      ),
      body: ListView(
        addAutomaticKeepAlives: true,
        children: <Widget>[],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => addSpend()),
            );
          },
          child: const Icon(Icons.add)),
      bottomNavigationBar: Nav(),
    );
  }
}
