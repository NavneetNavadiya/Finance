import 'package:flutter/material.dart';
import 'package:sqflite_common/sqlite_api.dart';

import './navigation_bar.dart';
import 'database/db.dart';
import 'addSpend.dart';
import 'package:finance/addSpend.dart';

import 'spend.dart';

class SpendingPage extends StatelessWidget {
  List<Map<String, dynamic>> map =
      DBhelper.instance.SpendMap() as List<Map<String, dynamic>>;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المصاريف"),
      ),
      body: ListView(
        addAutomaticKeepAlives: true,
        children: <Widget>[
          Container(
              child: Card(
                  child: ListTile(
                      leading: const Icon(Icons.album),
                      title: const Text("الفاتورة"),
                      subtitle: Text(map[0]['value'] as String)))),
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

test() {
  return;
}
