import '../constants/exports.dart';

class SecureStorageService {
  final _secureStorage = locator<FlutterSecureStorage>();

  Future<void> write(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      logger.e(e.toString());
    }
  }

  Future<String?> read(String key) async {
    String? data;
    try {
      data = await _secureStorage.read(key: key);
    } catch (e) {
      logger.e(e.toString());
    }
    return data;
  }

  Future<void> delete(String key) async {
    try {
      await _secureStorage.delete(key: key);
    } catch (e) {
      logger.e(e.toString());
    }
  }

  Future<void> clear() async {
    try {
      await _secureStorage.deleteAll();
    } catch (e) {
      logger.e(e.toString());
    }
  }
}
