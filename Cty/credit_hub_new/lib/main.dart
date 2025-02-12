import 'package:credit_hub_new/src/utils/app_dependencies.dart';
import 'package:device_preview/device_preview.dart';
import 'package:credit_hub_new/src/shared/app_export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  provideDependencies();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GlobalManager _globalManager = Get.find();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      initialRoute: AppRoute.splash.name,
      onGenerateRoute: AppRouteExt.generateRoute,
      navigatorKey: _globalManager.navigatorKey,
    );
  }
}
