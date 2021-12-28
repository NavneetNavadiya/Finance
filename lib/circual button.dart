import 'package:finance/Imag.dart';
import 'package:flutter/material.dart';

import 'boldText.dart';

class CButton extends StatelessWidget {
  @override
  late final String _name;
  late final String _path;
  var  _function;
  late final Color _color;



    CButton(this._name,this._color,this._path,this._function);
  Widget build(BuildContext context) {

    return InkWell(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100.0),
                  topLeft: Radius.circular(100.0),
                  bottomRight: Radius.circular(100.0),
                  bottomLeft: Radius.circular(100.0)

              ),
              color: _color
          ),
          child: Column(
              children: <Widget>[
            Img(_path, _function),
                Boldtext(_name),
          ]
    ),
    )
    );
  }

}