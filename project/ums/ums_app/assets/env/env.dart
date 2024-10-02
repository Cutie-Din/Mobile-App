import "package:flutter_dotenv/flutter_dotenv.dart";

mixin Env {
  static Future<void> init() async {
    await dotenv.load(fileName: 'assets/env/.env');
    assert(dotenv.env.containsKey('ENV'));
    final envName = dotenv.get('ENV', fallback: '');

    await dotenv.load(fileName: 'assets/env/.env.$envName');
  }

  static String get enviromentName {
    return dotenv.get('ENVIROMENT_NAME', fallback: '');
  }

  static String get apiAuth {
    return dotenv.get('API_AUTH', fallback: '');
  }

  static String get sentryDns {
    return dotenv.get('SENTRY_DNS', fallback: '');
  }
}
