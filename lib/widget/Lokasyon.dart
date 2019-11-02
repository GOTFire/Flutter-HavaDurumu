import 'package:flutter/material.dart';

class LokasyonWidget extends StatelessWidget {
  final String secilenSehir;

  LokasyonWidget({@required this.secilenSehir});

  @override
  Widget build(BuildContext context) {
    return Text(
      secilenSehir,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}
