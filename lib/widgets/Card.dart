import 'package:finance/database/db.dart';
import 'package:finance/widgets/text.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class list extends StatelessWidget {
  late String _id;
  late String _date;
  late String _amount;
  late String _note;
  late String _type;
  late int _devider;
  list(this._id, this._date, this._type, this._amount, this._note,
      this._devider);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onLongPress: () async {
          await delete(context, _id, _devider);
        },
        child: Card(
          color: Colors.white,
          borderOnForeground: false,
          semanticContainer: true,
          elevation: 50,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: text(
                    _id + '\n' + ' التاريخ: ' + _date + '\nالنوع :' + _type),
                subtitle: text('قيمة: ' + _amount + '\nالملاحظة: ' + _note),
              ),
            ],
          ),
        ));
  }
}

delete(context, id, int devider) {
  return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text('تحذير!!'),
            content: const Text('سيتم عملية حذف'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('الغاء'),
              ),
              TextButton(
                onPressed: () async {
                  if (devider == 0) {
                    await DBhelper.instance.deleteIncome(id);
                  }
                  if (devider == 1) {
                    await DBhelper.instance.deleteBill(id);
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => app(),
                      ));
                },
                child: const Text('حذف'),
              ),
            ],
          ));
}
