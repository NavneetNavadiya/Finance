import 'database/db.dart';

class Income {
  late int id;
  late String type;
  late double amount;
  late String date;

  Income(
      {required this.id,
      required this.type,
      required this.amount,
      required this.date});
  setID(id) {
    this.id = id;
  }

  setType(type) {
    this.type = type;
  }

  setAmount(amount) {
    this.amount = amount;
  }

  setDate(date) {
    this.date = date;
  }

  getID() {
    return this.id;
  }

  getType() {
    return this.type;
  }

  getAmount() {
    return this.amount;
  }

  getDate() {
    return this.date;
  }

  List<Income> _items = [];

  List<Income> get itmes {
    return [..._items];
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'date': date, 'value': amount, 'type': type};
  }

  @override
  String toString() {
    return 'Spend{id:$id, date:$date, value:$amount, type:$type}';
  }

  Income.fromMap(Map<String, dynamic> map) {
    id = map[DBhelper.ID];
    date = map[DBhelper.DATE];
    type = map[DBhelper.TYPE];
    amount = map[DBhelper.VALUE];
  }
}
