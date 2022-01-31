import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Creditv2(_balance, last, bill) {
  late DateTime _date = DateTime.now();
  final DateFormat formatter = DateFormat('yy-MM');
  late String _formatted = formatter.format(_date);
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromRGBO(35, 60, 103, 1),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                radius: 16,
                backgroundColor: Color.fromRGBO(50, 172, 121, 1),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              Text(
                "رصيد",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              )
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            _balance,
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                letterSpacing: 2.0),
          ),
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
                    "أخر عملية",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue[100],
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2.0),
                  ),
                  Text(
                    last,
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
                    "مجموع",
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
      ));
}
