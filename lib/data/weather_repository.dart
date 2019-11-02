import 'package:hava_durumum/data/weather_api_client.dart';
import 'package:hava_durumum/locator.dart';
import 'package:hava_durumum/models/weather.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> getWeather(String sehir) async {

    final int sehirID = await weatherApiClient.getLocationID(sehir);
    return await weatherApiClient.getWeather(sehirID);
  }




}
