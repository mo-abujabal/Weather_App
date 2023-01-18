import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      date: DateTime.parse(data['current']['last_updated']),
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
    );
  }
  String getImage() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Partly cloudy') {
      return 'assets/images/rainy.png';
    } else {
      return 'assets/images/thunderstorm.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear') {
      return Colors.orange;
    } else if (weatherStateName == 'Cloudy') {
      return Colors.blue;
    } else if (weatherStateName == 'Partly cloudy') {
      return Colors.blue;
    } else {
      return Colors.orange;
    }
  }
}
