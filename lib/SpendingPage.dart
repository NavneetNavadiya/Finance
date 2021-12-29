import 'package:flutter/material.dart';
import 'package:sqflite_common/sqlite_api.dart';

import './navigation_bar.dart';
import 'database/db.dart';
import 'addSpend.dart';
import 'package:finance/addSpend.dart';

class SpendingPage extends StatelessWidget {
  Future<List<Map<String, dynamic>>> map = DBhelper.instance.SpendMap();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المصاريف"),
      ),
      body: ListView(
        addAutomaticKeepAlives: true,
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Container(),
                ListTile(
                    leading: Icon(Icons.album),
                    title: Text("الفاتورة"),
                    subtitle: Text('hallow world'))
              ],
            ),
          ),
        ],
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
