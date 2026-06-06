// lib/widgets/weather_icon.dart
import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String condition; // "sunny", "rainy", etc
  WeatherIcon({required this.condition});
  @override
  Widget build(BuildContext context) {
    return Icon(condition == 'sunny' ? Icons.sunny : Icons.cloud, size: 80);
  }
}
