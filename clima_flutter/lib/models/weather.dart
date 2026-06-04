// lib/models/weather.dart
class Weather {
  final String city;
  final double temp;
  final String condition;
  final String unit;

  Weather({
    required this.city,
    required this.temp,
    required this.condition,
    required this.unit,
  }) {
    if (city.trim().isEmpty) {
      throw ArgumentError('El nombre de la ciudad no puede estar vacío.');
    }
    if (temp < -60 || temp > 60) {
      throw ArgumentError('La temperatura debe estar en el rango de -60 a 60.');
    }
  }

   // Sirve para convertir un mapa de datos JSON en una instancia de la clase Weather.
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'] ?? 'Desconocida',
      temp: json['main']['temp'].toDouble(),
      condition: json['weather'][0]['description'] ?? 'Desconocido',
      unit: 'C',
    );
  }
}