import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/weather_cubit/get_weather_cubit.dart';


class SearchView extends StatelessWidget {
   const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search 🔍',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: TextField(
            keyboardType: TextInputType.text,
            onSubmitted: (value){
              BlocProvider.of<GetWeatherCubit>(context).getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: 18, horizontal: 16
              ),
              hintText: 'Enter city name',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
              labelText: 'Search',
              labelStyle: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
              suffixIcon: Icon(
                  Icons.search,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
           ),
          ),
        ),
      ),
    );
  }
}
