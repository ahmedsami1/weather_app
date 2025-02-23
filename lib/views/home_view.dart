import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

import '../cubit/weather_cubit/get_weather_cubit.dart';
import '../cubit/weather_cubit/get_weather_states.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Weather App ☁️',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context)=>SearchView()
                    ),
                );
              },
              icon: Icon(Icons.search_outlined),
          ),
        ],
        elevation: 0,
      ),
      body: BlocBuilder<GetWeatherCubit,WeatherStates>(
        builder: (context, state){
          if(state is WeatherLoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if (state is WeatherLoadedState){
            return WeatherInfoBody();
          }else if (state is WeatherFailureState){
            return Center(
              child: Text(
                  'oops there was an error, try later'),
            );
        }else{
            return NoWeatherBody();
          }
        },
      ),
    );
  }
}
