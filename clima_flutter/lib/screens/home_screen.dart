// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import '../providers/weather_provider.dart';
import '../utils/weather_utils.dart';
import 'search_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherProvider);
    final weatherNotifier = ref.read(weatherProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima Actual'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              
              // --- SECCIóN DEL CLIMA ---
              if (weather == null)
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Sin conexión BLE o sin datos.', // Cumple con el paso 13
                    style: TextStyle(fontSize: 18)
                  ),
                )
              else
                Column(
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
                  ],
                ),
              
              const SizedBox(height: 40),
              const Divider(),
              const SizedBox(height: 20),

              // --- SECCIóN BLUETOOTH---
              const Text('Dispositivos BLE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              
              ElevatedButton.icon(
                icon: const Icon(Icons.bluetooth_searching),
                label: const Text('Buscar dispositivos BLE'),
                onPressed: () {
                  // Llama al escáner.
                  weatherNotifier.bleService.scanForDevices();
                },
              ),

              const SizedBox(height: 20),

              StreamBuilder<List<ScanResult>>(
                stream: FlutterBluePlus.scanResults,
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No se encontraron dispositivos.');
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final result = snapshot.data![index];
                      final device = result.device;
                      
                      final deviceName = device.advName.isNotEmpty ? device.advName : 'Dispositivo Desconocido';

                      return ListTile(
                        leading: const Icon(Icons.bluetooth),
                        title: Text(deviceName),
                        subtitle: Text(device.remoteId.str), // la dirección MAC.
                        trailing: ElevatedButton(
                          child: const Text('Conectar'),
                          onPressed: () async {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Conectando a $deviceName...')),
                            );
                            
                            await weatherNotifier.connectToWearable(device);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}