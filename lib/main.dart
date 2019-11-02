import 'package:flutter/material.dart';
import 'package:hava_durumum/locator.dart';
import 'package:hava_durumum/view_model/temam_view_modeli.dart';
import 'package:hava_durumum/view_model/weather_view_model.dart';
import 'package:provider/provider.dart';

import 'widget/hava_durumum.dart';

void main() {
  setupLocator(); //singletonları kaydettirdik
  runApp(ChangeNotifierProvider(
      builder: (context) => TemamViewModeli(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TemamViewModeli>(
      builder: (context, TemamViewModeli temam, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: temam.myTheme.tema,

        home: ChangeNotifierProvider(
            builder: (context) => locator<WeatherViewModel>(),
            child: HavaDurumum()),
      ),
    );
  }
}
