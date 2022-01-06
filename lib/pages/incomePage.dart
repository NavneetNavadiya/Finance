import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../navigation/navigation_bar.dart';
import '../database/db.dart';
import 'addIncome.dart';
import '../Income.dart';

bool isIncomeLoading = false;
late Income? _income;

class IncomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _page();
  }
}

class _page extends State<IncomePage> {
  Future refreshIncome() async {
    setState(() => isIncomeLoading = true);

    Incomes = (await DBhelper.instance.PrintIncomes());

    setState(() => isIncomeLoading = false);
  }

  @override
  void initState() {
    refreshIncome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المدخول"),
      ),
      body: isIncomeLoading
          ? CircularProgressIndicator()
          : Incomes.isEmpty
              ? const Text("NO INCOMES!")
              : buildInomes(),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            refreshIncome();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => addIncome()),
            );
            refreshIncome();
          },
          child: const Icon(Icons.add)),
      bottomNavigationBar: Nav(1),
    );
  }

  Widget buildInomes() => StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(8),
      itemCount: Incomes.length,
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      crossAxisCount: 1,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      itemBuilder: (context, index) {
        _income = Incomes[index];

        if (_income != null) {
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(_income!.getID().toString() +
                      ' Date: ' +
                      _income!.getDate() +
                      '\nType :' +
                      _income!.getType()),
                  subtitle: Text(
                      'Amount of income: ' + _income!.getAmount().toString()),
                ),
              ],
            ),
          );
        } else
          return Text('NO INCOMES');
      });
}
