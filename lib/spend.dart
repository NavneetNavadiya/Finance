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
