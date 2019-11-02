import 'package:flutter/material.dart';

class SehirSecWidget extends StatefulWidget {
  @override
  _SehirSecWidgetState createState() => _SehirSecWidgetState();
}

class _SehirSecWidgetState extends State<SehirSecWidget> {
  final _textKontrolcusu = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Şehrini Seç"),
      ),
      body: Form(
          child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _textKontrolcusu,
                decoration: InputDecoration(
                    labelText: "şehir",
                    hintText: "şehirinizi girin",
                    border: OutlineInputBorder()),
              ),
            ),
          ),
          FlatButton.icon(
              onPressed: () {
                Navigator.pop(context, _textKontrolcusu.text);
              },
              icon: Icon(Icons.search),
              label: Text("ok"))
        ],
      )),
    );
  }
}
