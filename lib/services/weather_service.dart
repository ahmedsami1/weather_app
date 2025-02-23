import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices{
  WeatherServices({required this.dio});
  final Dio dio ;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '5e2515fe52a84e96869204902240307';


  Future<WeatherModel> getForcast({required String cityName})async{

      try {
        Response response = await dio
            .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

        WeatherModel weatherModel = WeatherModel.fromJson(response.data);
       return weatherModel;
      }on DioException catch (e) {
        final String errorMessage = e.response?.data['error']['message'] ?? 'oops there was an error, try later ';
        throw Exception(errorMessage);
      }catch(e){
        log(e.toString());
        throw Exception('oops there was an error, try later ');
      }

    }

  }
