// lib/providers/weather_provider.dart
import 'package:flutter/material.dart';
import '../models/weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import '../services/ble_service.dart';

class WeatherNotifier extends Notifier<Weather?> {

  final bleService = BLEService();

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

  // Método para conectar al wearable y leer datos.
  Future<void> connectToWearable(BluetoothDevice device) async {
    await bleService.connectAndRead(device);
    
    updateWeather('Ciudad Wearable', 26.0, 'despejado');
  }
}

final weatherProvider = NotifierProvider<WeatherNotifier, Weather?>(() {
  return WeatherNotifier();
});