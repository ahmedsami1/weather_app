import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';

import '../cubit/weather_cubit/get_weather_cubit.dart';
import '../helper.dart';


class WeatherInfoBody extends StatelessWidget {
   const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getThemeColors(
            BlocProvider.of<GetWeatherCubit>(context).
            weatherModel?.condition,
          ),
            Colors.white,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
            18.0,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  weatherModel.cityName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                  'Updated at:  ${weatherModel.lastUpdated.hour}:${weatherModel.lastUpdated.minute}',
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                      'https:${weatherModel.icon}',
                    fit: BoxFit.cover,
                  ),
                  Text(
                    '${weatherModel.temp.round()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                         'maxTemp: ${weatherModel.maxTemp.round()}',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                          'minTemp: ${weatherModel.minTemp.round()}',
                        style: TextStyle(
                            fontSize: 12
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                weatherModel.condition,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

