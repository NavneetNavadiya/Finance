import 'package:finance/database/db.dart';
import 'package:finance/pages/addBill.dart';
import 'package:finance/pages/addIncome.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Credit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return widgets();
  }
}

class widgets extends State<Credit> {
  @override
  Widget build(BuildContext context) {
    late DateTime _date = DateTime.now();
    final DateFormat formatter = DateFormat('yy-MM');
    late String _formatted = formatter.format(_date);
    return Card(
        color: Colors.white,
        borderOnForeground: false,
        semanticContainer: true,
        elevation: 10,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color.fromRGBO(35, 60, 103, 1), width: 10),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromRGBO(35, 60, 103, 1),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "رصيد",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                    IconButton(
                      icon: Icon(Icons.add_circle),
                      color: Colors.green,
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => addIncome()),
                        ).then((value) => setState(() {}));
                      },
                    ),
                    IconButton(
                      color: Colors.red,
                      icon: Icon(Icons.remove_circle),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => addBill()),
                        ).then((value) => setState(() {}));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                FutureBuilder(
                    future: DBhelper.instance.getBillsTotal(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // do not change this text
                        print("snapshot.data -> ");
                        print(snapshot.data);
                      }
                      return Text(
                        balance,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.0),
                      );
                    }),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "متوسط الصرف",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue[100],
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2.0),
                        ),
                        Text(
                          avg,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[100],
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2.0),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "التاريخ",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue[100],
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2.0),
                        ),
                        Text(
                          _formatted,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[100],
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2.0),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          " مجموع الصرف",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue[100],
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2.0),
                        ),
                        Text(
                          bill,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[100],
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2.0),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )));
  }
}
