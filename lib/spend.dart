import 'package:flutter/cupertino.dart';

import 'database/db.dart';

class Spend {
  late int id;
  late final String date;
  late final double value;
  late final String type;

  Spend(
      {required this.id,
      required this.date,
      required this.type,
      required this.value});

  getVlaue() {
    return this.value;
  }

  getType() {
    return this.type;
  }

  setID(id) {
    this.id = id;
  }

  List<Spend> _items = [];

  List<Spend> get itmes {
    return [..._items];
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'date': date, 'value': value, 'type': type};
  }

  @override
  String toString() {
    return 'Spend{id:$id, date:$date, value:$value, type:$type }';
  }

  Spend.fromMap(Map<String, dynamic> map) {
    id = map[DBhelper.COLUMN_ID];
    date = map[DBhelper.COLUMN_DATE];
    type = map[DBhelper.COLUMN_TYPE];
    value = map[DBhelper.COLUMN_VALUE];
  }
}
