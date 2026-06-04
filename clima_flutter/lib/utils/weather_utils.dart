// lib/utils/weather_utils.dart
import 'package:flutter/material.dart';

String formatTemperature(double temp, String unit) {
  return '${temp.round()}°$unit';
}

IconData getWeatherIcon(String condition) {
  switch (condition.toLowerCase()) {
    case 'soleado':
    case 'despejado':
      return Icons.wb_sunny;
    case 'lluvioso':
    case 'lluvia':
      return Icons.water_drop;
    case 'nublado':
      return Icons.cloud;
    default:
      return Icons.wb_cloudy; 
  }
}