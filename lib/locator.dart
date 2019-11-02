import 'package:get_it/get_it.dart';
import 'package:hava_durumum/data/weather_api_client.dart';
import 'package:hava_durumum/data/weather_repository.dart';
import 'package:hava_durumum/view_model/weather_view_model.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApiClient());
  locator.registerFactory(() => WeatherViewModel());
}
