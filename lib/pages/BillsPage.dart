// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../navigation/navigation_bar.dart';
import '../database/db.dart';
import './addBill.dart';
import '../bill.dart';
import '../widgets/Card.dart';

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

        String _id = _bill!.getID().toString();
        String _date = _bill!.getDate();
        String _type = _bill!.getType();
        String _amount = _bill!.getValue().toString();
        String _note = _bill!.getNote();

        if (_bill != null) {
          return list(_id, _date, _type, _amount, _note);
        } else
          return Text('no bills');
      });
}
