<<<<<<< HEAD
// import 'database/db.dart';

// class Spend {
//   late final int id;
//   late final DateTime date;
//   late final double value;
//   late final String type;
//   Spend(this.id, this.date, this.type, this.value);
//   Map<String, dynamic> toMap() {
//     var map = <String, dynamic>{
//       DBhelper.COLUMN_DATE: date,
//       DBhelper.COLUMN_TYPE: type,
//       DBhelper.COLUMN_VALUE: value,
//     };
//     if (id != null) {
//       map[DBhelper.COLUMN_ID] = id;
//     }
//     return map;
//   }

//   Spend.fromMap(Map<String, dynamic> map) {
//     id = map[DBhelper.COLUMN_ID];
//     date = map[DBhelper.COLUMN_DATE];
//     type = map[DBhelper.COLUMN_TYPE];
//     value = map[DBhelper.COLUMN_VALUE];
//   }
// }
=======
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
>>>>>>> 60d0d61919c302dbe610ff1c7958533884974bd0
