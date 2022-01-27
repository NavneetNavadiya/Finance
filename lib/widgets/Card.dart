import 'package:finance/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class list extends StatelessWidget {
  late String _id;
  late String _date;
  late String _amount;
  late String _note;
  late String _type;
  list(this._id, this._date, this._type, this._amount, this._note);

  @override
  Widget build(BuildContext context) {
    return Card(
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
            title:
                text(_id + '\n' + ' التاريخ: ' + _date + '\nالنوع :' + _type),
            subtitle: text('قيمة: ' + _amount + '\nالملاحظة: ' + _note),
          ),
        ],
      ),
    );
  }
}
