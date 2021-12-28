import 'database/db.dart';

class Spend {
  late final int _id;
  late final DateTime _date;
  late final double _value;
  late final String _type;
  Spend(this._id, this._date, this._type, this._value);


  int get id => _id;

  DateTime get date => _date;

  double get value => _value;

  String get type => _type;
}
