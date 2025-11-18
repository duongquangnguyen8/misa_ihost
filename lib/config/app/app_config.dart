// Source - https://stackoverflow.com/a
// Posted by CopsOnRoad, modified by community. See post 'Timeline' for change history
// Retrieved 2025-11-18, License - CC BY-SA 4.0

import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';

class AppConfig {
  //getDeviceId
  static Future<String?> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      await deviceInfo.androidInfo;
      return AndroidId().getId();
    }
    return null;
  }
}
