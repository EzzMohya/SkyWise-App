import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/core/models/weather_model/weather_model.dart';
import 'package:weather/core/services/weather_service.dart';

class WeatherController extends ChangeNotifier {
  int _selectedIndex = 0;
  WeatherService weatherService = WeatherService();

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  bool _isBool = false;

  bool get isBool => _isBool;

  set isBool(bool value) {
    _isBool = value;
    notifyListeners();
  }

  convertFahrenheit(int Celsius) {
    double Fahrenheit = (Celsius * 1.8) + 32;
    return Fahrenheit.round();
  }

  WeatherModel? weatherModel;
  Position? position;
  Future getWeather() async {
    position = await Geolocator.getCurrentPosition();
    print(position!.altitude);
    try {
      weatherModel = await weatherService.getWeather(
          lat: position!.latitude, lan: position!.longitude);
    } on Exception catch (e) {
      print('hello');
    }
  }
}
