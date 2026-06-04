// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/weather_provider.dart';
import '../utils/weather_utils.dart';
import 'search_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima Actual'),
        centerTitle: true,
      ),
      body: Center(
        child: weather == null
            ? const Text('Sin datos. Presiona el botón para probar.', style: TextStyle(fontSize: 18))
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formatTemperature(weather.temp, weather.unit),
                    style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    weather.city,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 32),
                  Icon(
                    getWeatherIcon(weather.condition),
                    size: 120,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 32),
                  const Text('Humedad: 65% | Viento: 12 km/h'),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SearchScreen()),
                      );
                    },
                    child: const Text('Buscar Ciudades'),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(weatherProvider.notifier).updateWeather('Tokyo', 22.0, 'soleado');
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}