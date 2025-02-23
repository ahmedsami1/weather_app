import '../../models/weather_model.dart';

class WeatherStates{}

class WeatherInitialState extends WeatherStates{}
class WeatherLoadingState extends WeatherStates{}
class WeatherLoadedState extends WeatherStates{
  WeatherLoadedState({required this.weatherModel});
  WeatherModel weatherModel;
}

class WeatherFailureState extends WeatherStates{}