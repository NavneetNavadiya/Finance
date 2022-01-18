import 'package:flutter/material.dart';

class inputNote extends StatelessWidget {
  late String _note;
  inputNote(this._note);
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 10.0,
        height: 10.0,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'ملاحظة',
        labelText: 'ملاحظة',
      ),
      keyboardType: TextInputType.multiline,
      onChanged: (text) {
        setNote(text);
      },
    );
  }

  setNote(note) {
    this._note = note;
  }

  getNote() {
    return this._note;
  }
}
