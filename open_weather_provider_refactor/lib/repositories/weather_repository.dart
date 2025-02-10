import 'package:open_weather_provider_refactor/exceptions/weather_exception.dart';
import 'package:open_weather_provider_refactor/models/custom_error.dart';
import 'package:open_weather_provider_refactor/models/direct_geocoding.dart';
import 'package:open_weather_provider_refactor/models/weather.dart';
import 'package:open_weather_provider_refactor/services/weather_api_services.dart';

class WeatherRepository {
  final WeatherApiServices weatherApiServices;

  WeatherRepository({required this.weatherApiServices});

  // 사용자가 입력한 도시를 받아서 getDirectGeocoding, getWeather api를 연속으로 호출
  Future<Weather> fetchWeather(String city) async {
    try {
      final DirectGeocoding directGeocoding = await weatherApiServices.getDirectGeocoding(city);
      print('directGeocoding: $directGeocoding');

      final Weather tempWeather = await weatherApiServices.getWeather(directGeocoding);

      final Weather weather = tempWeather.copyWith(name: directGeocoding.name, country: directGeocoding.country);

      return weather;
    } on WeatherException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
