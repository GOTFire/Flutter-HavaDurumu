import 'package:flutter/material.dart';

class Temam{

  MaterialColor _renk;
  ThemeData _tema;

  MaterialColor get renk => _renk;

  set renk(MaterialColor value) {
    _renk = value;
  }

  ThemeData get tema => _tema;

  set tema(ThemeData value) {
    _tema = value;
  }

  Temam(this._renk, this._tema);


}