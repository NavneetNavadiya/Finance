import 'database/db.dart';

class Bill {
  late int id;
  late String date;
  late double value;
  late String type;
  late String note;

  Bill(
      {required this.id,
      required this.date,
      required this.type,
      required this.value,
      required this.note});

  double getValue() {
    return this.value;
  }

  String getType() {
    return this.type;
  }

  String getNote() {
    return this.note;
  }

  String getDate() {
    return this.date;
  }

  setID(id) {
    this.id = id;
  }

  int getID() {
    return this.id;
  }

  List<Bill> _items = [];

  List<Bill> get itmes {
    return [..._items];
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'date': date, 'value': value, 'type': type, 'note': note};
  }

  @override
  String toString() {
    return 'Spend{id:$id, date:$date, value:$value, type:$type , note:$note }';
  }

  Bill.fromMap(Map<String, dynamic> map) {
    id = map[DBhelper.ID];
    date = map[DBhelper.DATE];
    type = map[DBhelper.TYPE];
    value = map[DBhelper.VALUE];
    note = map[DBhelper.NOTE];
  }
}
