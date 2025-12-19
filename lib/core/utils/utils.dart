import 'package:device_info_plus/device_info_plus.dart';

import '../constants/exports.dart';

class Utils {
  Future<String?> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? deviceId;

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        // Use the androidId. Note: this value changes if the app is uninstalled on Android 8.0+
        deviceId = androidInfo.id;
      } else {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        // Use identifierForVendor (IDFV). It is unique to the vendor, but changes if all apps from the vendor are uninstalled.
        deviceId = iosInfo.identifierForVendor;
      }
    } catch (e) {
      logger.e('Error getting device ID: $e');
    }

    return deviceId;
  }
}
