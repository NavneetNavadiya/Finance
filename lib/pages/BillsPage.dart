// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../navigation/navigation_bar.dart';
import '../database/db.dart';
import './addBill.dart';
import '../bill.dart';

bool isBillsLoading = false;
late Bill? _bill;

class Billpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _page();
  }
}

class _page extends State<Billpage> {
  Future refreshBills() async {
    setState(() => isBillsLoading = true);

    Bills = (await DBhelper.instance.PrintBills());

    setState(() => isBillsLoading = false);
  }

  @override
  void initState() {
    refreshBills();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المصاريف"),
      ),
      body: isBillsLoading
          ? CircularProgressIndicator()
          : Bills.isEmpty
              ? const Text("NO BILLS!")
              : buildBills(),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            refreshBills();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => addBill()),
            );
            refreshBills();
          },
          child: const Icon(Icons.add)),
      bottomNavigationBar: Nav(3),
    );
  }

  Widget buildBills() => StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(8),
      itemCount: Bills.length,
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      crossAxisCount: 1,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      itemBuilder: (context, index) {
        _bill = Bills[index];

        if (_bill != null) {
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(_bill!.getID().toString() +
                      ' Date: ' +
                      _bill!.getDate() +
                      '\nType :' +
                      _bill!.getType()),
                  subtitle: Text('spend: ' +
                      _bill!.getValue().toString() +
                      '\nNote: ' +
                      _bill!.getNote()),
                ),
              ],
            ),
          );
        } else
          return Text('no bills');
      });
}
