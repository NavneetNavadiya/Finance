// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sqflite_common/sqlite_api.dart';

import './navigation_bar.dart';
import 'database/db.dart';
import 'addSpend.dart';
import 'package:finance/addSpend.dart';
import 'spend.dart';

bool isLoading = false;
late List<Spend> Spends;
late Spend? spend;

class SpendingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _page();
  }
}

class _page extends State<SpendingPage> {
  Future refreshSpends() async {
    setState(() => isLoading = true);

    Spends = (await DBhelper.instance.PrintAll());

    setState(() => isLoading = false);
  }

  @override
  void initState() {
    refreshSpends();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المصاريف"),
      ),
      body: isLoading
          ? CircularProgressIndicator()
          : Spends.isEmpty
              ? const Text("NO Bills!")
              : buildSpneds(),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            refreshSpends();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => addSpend()),
            );
            refreshSpends();
          },
          child: const Icon(Icons.add)),
      bottomNavigationBar: Nav(),
    );
  }

  Widget buildSpneds() => StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(8),
      itemCount: Spends.length,
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      crossAxisCount: 1,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      itemBuilder: (context, index) {
        spend = Spends[index];
        if (spend != null) {
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text('Type :' + spend?.getType()),
                  subtitle: Text(''),
                ),
              ],
            ),
          );
        } else
          return Text('no bills');
      });
}



/*
Container(
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.album),
          title: const Text("الفاتورة"),
          subtitle: Text(map[0]['value'] as String),
        ),
      ),
    )
*/ 