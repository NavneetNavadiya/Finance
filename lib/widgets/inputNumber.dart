import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class inputMoney extends StatelessWidget {
  late String _Textvalue = '0';
  inputMoney(this._Textvalue);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 30.0,
        height: 2.0,
      ),
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'مبلغ',
          labelText: 'المبلغ',
          suffixIcon: Icon(Icons.money)),
      keyboardType: TextInputType.phone,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
      ],
      onChanged: (text) {
        setValue(text);
      },
    );
  }

  getValue() {
    return this._Textvalue;
  }

  setValue(value) {
    this._Textvalue = value;
  }
}
