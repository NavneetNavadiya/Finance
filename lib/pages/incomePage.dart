import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../database/db.dart';
import 'addIncome.dart';
import '../Income.dart';
import '../widgets/Card.dart';
import '../main.dart';

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
              ? const Text(
                  "لا يوجد مدخول !",
                  textAlign: TextAlign.center,
                )
              : buildIncomes(),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            refreshIncome();
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => addIncome()),
            );
            refreshIncome();
          },
          child: const Icon(Icons.add)),
    );
  }

  Widget buildIncomes() => StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(8),
      itemCount: Incomes.length,
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      crossAxisCount: 1,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      itemBuilder: (context, index) {
        _income = Incomes[index];

        String _id = _income!.getID().toString();
        String _date = _income!.getDate();
        String _type = _income!.getType();
        String _amount = _income!.getAmount().toString();
        String _note = '';
        if (_income != null) {
          return list(_id, _date, _type, _amount, _note);
        } else
          return Text('NO INCOMES');
      });
}
