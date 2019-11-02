import 'package:flutter/material.dart';
import 'package:hava_durumum/models/temam.dart';

class TemamViewModeli with ChangeNotifier {
  Temam _myTheme;

  TemamViewModeli() {
    _myTheme = Temam(Colors.blue, ThemeData.light());
  }

  Temam get myTheme => _myTheme;

  set myTheme(Temam value) {
    _myTheme = value;
    notifyListeners();
  }

  void temaDegistir(String havaDurumuKisaltmasi) {

    Temam _geciciTema;

    switch (havaDurumuKisaltmasi) {
      case "sn":
      case "sl":
      case "h":
      case "t":
      case "hc":
        _geciciTema = Temam(
          Colors.grey,
          ThemeData(primaryColor: Colors.blueGrey),
        );
        break;
      case "hr":
      case "lr":
      case "s":
        _geciciTema = Temam(
          Colors.indigo,
          ThemeData(primaryColor: Colors.indigoAccent),
        );
        break;
      case "lc":
      case "c":
        _geciciTema = Temam(
          Colors.yellow,
          ThemeData(primaryColor: Colors.orangeAccent),
        );
        break;
    }

    myTheme = _geciciTema;
  }
}
