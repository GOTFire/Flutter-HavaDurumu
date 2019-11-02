import 'package:flutter/material.dart';
import 'package:hava_durumum/view_model/weather_view_model.dart';
import 'package:provider/provider.dart';

class SonGuncellemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _weatherModelView = Provider.of<WeatherViewModel>(context);
    var _guncelTarih = _weatherModelView.getirilenHavaDurumu.time.toLocal();


    return Text("Son Güncelleme " + TimeOfDay.fromDateTime(_guncelTarih).format(context),style: TextStyle(fontSize: 22),);
  }
}
