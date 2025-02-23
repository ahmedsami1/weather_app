import 'package:flutter/material.dart';

MaterialColor getThemeColors(String? condition){
  if (condition == null) return Colors.blue;

  switch (condition.toLowerCase()) {
    case "sunny":
    case "clear":
      return Colors.orange;

    case "partly cloudy":
    case "cloudy":
    case "overcast":
      return Colors.grey;

    case "mist":
    case "fog":
    case "freezing fog":
      return Colors.blueGrey;

    case "patchy rain possible":
    case "light drizzle":
    case "light rain":
    case "moderate rain":
    case "heavy rain":
    case "torrential rain shower":
      return Colors.blue;

    case "patchy snow possible":
    case "light snow":
    case "moderate snow":
    case "heavy snow":
    case "blizzard":
      return Colors.lightBlue;

    case "patchy sleet possible":
    case "light sleet":
    case "moderate or heavy sleet":
    case "light freezing rain":
    case "moderate or heavy freezing rain":
      return Colors.cyan;

    case "thundery outbreaks possible":
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
    case "patchy light snow with thunder":
    case "moderate or heavy snow with thunder":
      return Colors.deepPurple;

    default:
      return Colors.blue; // Default MaterialColor
  }
}