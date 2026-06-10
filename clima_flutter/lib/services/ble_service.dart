// lib/services/ble_service.dart
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BLEService {
  // Función para buscar dispositivos.
  Stream<List<ScanResult>> scanForDevices() {
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));
    return FlutterBluePlus.scanResults;
  }

  // Función para conectar, descubrir servicios y leer datos.
  Future<void> connectAndRead(BluetoothDevice device) async {
    try {
      await device.connect(license: License.nonprofit);

      List<BluetoothService> services = await device.discoverServices();

      // Recorre los servicios para encontrar sus características.
      for (BluetoothService service in services) {
        for (BluetoothCharacteristic characteristic in service.characteristics) {
          
          List<int> value = await characteristic.read();
          
          if (value.isNotEmpty) {
            print('Datos recibidos del dispositivo: $value');
          }
        }
      }
    } catch (e) {
      print('Error al conectar: $e');
    }
  }
}