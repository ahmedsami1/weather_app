import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/weather_model.dart';
import '../../services/weather_service.dart';
import 'get_weather_states.dart';


class GetWeatherCubit extends Cubit<WeatherStates>{
  GetWeatherCubit() : super(WeatherInitialState());
   WeatherModel? weatherModel;

  getWeather({required String cityName})async{
    emit(WeatherLoadingState());
    try {
      weatherModel = await WeatherServices(dio: Dio())
              .getForcast(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    }on Exception catch (e) {
      log(e.toString());
      emit(WeatherFailureState());
    }
  }

}