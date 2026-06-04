// lib/providers/weather_provider.dart
import 'package:flutter/material.dart';
import '../models/weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherNotifier extends StateNotifier<Weather?> {
  WeatherNotifier() : super(null);

  void updateWeather(String cityName, double newTemp, String newCondition) {
    final newWeather = Weather(
      city: cityName,
      temp: newTemp,
      condition: newCondition,
      unit: 'C',
    );
    
    // Al asignar este nuevo objeto a la variable interna 'state', 
    // Riverpod avisa automáticamente a la UI para que se actualice.
    state = newWeather;
  }
}

final weatherProvider = StateNotifierProvider<WeatherNotifier, Weather?>((ref) {
  return WeatherNotifier();
});