

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/Features/Home/Presentation/manager/weatherCubit/weather_states.dart';
import 'package:weather/core/models/weather_model/weather_model.dart';
import 'package:weather/core/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService;
   Position? position;
  WeatherModel? weatherModel;

  void getWeather() async {
    position = await Geolocator.getCurrentPosition();
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getWeather(
          lat: position!.latitude, lan: position!.longitude);
      emit(WeatherSuccess(weatherModel: weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
