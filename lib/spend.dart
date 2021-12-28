import 'database/db.dart';

class Spend {
  late final int id;
  late final String date;
  late final double value;
  late final String type;

  Spend(
      {required this.id,
      required this.date,
      required this.type,
      required this.value});

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
