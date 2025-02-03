import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static final String? _env = dotenv.env['ENV'];
  static final String? _hostUAT = dotenv.env['HOST_UAT'];
  static final String? _hostPROD = dotenv.env['HOST_PROD'];
  static final String? _proxy = dotenv.env['PROXY'];

  static String get env => _env ?? 'PROD';
  static String get hostPROD => _hostPROD ?? '';
  static String get hostUAT => _hostUAT ?? '';
  static String get proxy => _proxy ?? '';

  static bool get isUAT => _env == 'UAT';
  static String get url => isUAT ? hostUAT : hostPROD;

  static Future<String> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDevice = await deviceInfo.androidInfo;
      return androidDevice.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDevice = await deviceInfo.iosInfo;
      return iosDevice.identifierForVendor ?? '';
    }
    return '';
  }
}
