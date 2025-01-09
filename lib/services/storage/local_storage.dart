import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Save data (Create or Update)
  Future<bool> setValue(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
    return true;
  }

  // Retrieve data (Read)
  Future<String?> readValue(String key) async {
    return await _secureStorage.read(key: key);
  }

  // Delete data
  Future<bool> delete(String key) async {
    await _secureStorage.delete(key: key);
    return true;

  }

  // // Check if a key exists
  // Future<bool> containsKey(String key) async {
  //   final keys = await _secureStorage.readAll();
  //   return keys.containsKey(key);
  // }

  // Clear all data
  Future<void> clearAll() async {
    await _secureStorage.deleteAll();
  }
}
