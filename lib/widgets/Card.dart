import 'package:flutter/material.dart';

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(_id + ' Date: ' + _date + '\nType :' + _type),
            subtitle: Text('spend: ' + _amount + '\nNote: ' + _note),
          ),
        ],
      ),
    );
  }
}
