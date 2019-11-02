import 'package:flutter/material.dart';
import 'package:hava_durumum/view_model/weather_view_model.dart';
import 'package:provider/provider.dart';

class HavaDurumuResim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);

    return Column(
      children: <Widget>[
        Text(
          "Şuanki sıcaklık " +
              _weatherViewModel
                  .getirilenHavaDurumu.consolidatedWeather[0].theTemp
                  .floor()
                  .toString(),
          style: TextStyle(fontSize: 20),
        ),
        Image.network(
          "https://www.metaweather.com/static/img/weather/png/" +
              _weatherViewModel
                  .getirilenHavaDurumu.consolidatedWeather[0].weatherStateAbbr +
              ".png",
          height: 150,
          width: 150,
        )
      ],
    );
  }
}
