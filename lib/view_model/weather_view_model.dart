import 'package:flutter/material.dart';
import 'package:hava_durumum/data/weather_repository.dart';
import 'package:hava_durumum/locator.dart';
import 'package:hava_durumum/models/weather.dart';

//uygulama state/durumları
enum WeatherDurumlari { Init, Yukleniyor, Yuklendi, Hata }

class WeatherViewModel extends ChangeNotifier {

  //veri alınırken kullanılan repoyu çağırma
  WeatherRepository _repository = locator<WeatherRepository>();
  Weather _getirilenHavaDurumu;
  WeatherDurumlari _durum;

  //ilk hazırlık
  WeatherViewModel() {
    _getirilenHavaDurumu = Weather();
    durum = WeatherDurumlari.Init;
  }

  // set ve get ler
  WeatherDurumlari get durum => _durum;

  Weather get getirilenHavaDurumu => _getirilenHavaDurumu;

  set durum(WeatherDurumlari value) {
    _durum = value;
    notifyListeners();
  }


  // bloc taki eventler burada basit metodlar
  Future<Weather> HavaDurmumunuAl(String sehirAdi) async {
    try {
      durum = WeatherDurumlari.Yukleniyor;
      _getirilenHavaDurumu = await _repository.getWeather(sehirAdi);
      debugPrint("hava durumu bilgisi alındı");
      durum = WeatherDurumlari.Yuklendi;

      //notifyListeners();
    } catch (hata) {
      durum = WeatherDurumlari.Hata;
    }
    return _getirilenHavaDurumu;
  }


  Future<Weather> GuncelHavaDurmumunuAl(String sehirAdi) async {
    try {
      _getirilenHavaDurumu = await _repository.getWeather(sehirAdi);
      durum = WeatherDurumlari.Yuklendi;

      //notifyListeners();
    } catch (hata) {
      //durum = WeatherDurumlari.Hata;
    }
    return _getirilenHavaDurumu;
  }

  String HavaDurumuKisaltmasi(){

    return _getirilenHavaDurumu.consolidatedWeather[0].weatherStateAbbr;
  }

}
