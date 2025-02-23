import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

import 'cubit/weather_cubit/get_weather_cubit.dart';
import 'helper.dart';

void main() {
  runApp(const WeatherApp());
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit,WeatherStates>(
        builder: (context, state) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch: getThemeColors(
            BlocProvider.of<GetWeatherCubit>(context).
            weatherModel?.condition,
          ),
        ),
      );
  },
),
      ),
    );
  }
}


