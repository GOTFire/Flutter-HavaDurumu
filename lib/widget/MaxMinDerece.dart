import 'package:flutter/material.dart';
import 'package:hava_durumum/models/weather.dart';

class MaxMinDerece extends StatelessWidget {

  ConsolidatedWeather bugununDegerleri;

  MaxMinDerece(ConsolidatedWeather this.bugununDegerleri);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          "En yüksek : " + bugununDegerleri.maxTemp.floor().toString(),
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "En Düşük : " + bugununDegerleri.minTemp.floor().toString(),
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
