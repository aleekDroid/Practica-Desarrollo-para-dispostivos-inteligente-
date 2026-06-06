// lib/providers/weather_provider.dart
import 'package:flutter/material.dart';
import '../models/weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Cambiamos StateNotifier por Notifier
class WeatherNotifier extends Notifier<Weather?> {

  // En lugar de usar super(null), inicializamos el estado de arranque con este método
  @override
  Weather? build() {
    return null;
  }

  void updateWeather(String cityName, double newTemp, String newCondition) {
    final newWeather = Weather(
      city: cityName,
      temp: newTemp,
      condition: newCondition,
      unit: 'C',
    );

    // Al asignar este nuevo objeto a la variable state,
    // Riverpod avisa automáticamente a la UI para que se actualice.
    state = newWeather;
  }
}

final weatherProvider = NotifierProvider<WeatherNotifier, Weather?>(() {
  return WeatherNotifier();
});