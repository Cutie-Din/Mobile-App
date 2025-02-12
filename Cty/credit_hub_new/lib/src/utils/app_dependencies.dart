import 'package:credit_hub_new/src/shared/app_export.dart';
import 'package:dio/dio.dart';

void provideDependencies() {
  Get.put(AppManager());

  Get.put(NetworkManager());

  Get.lazyPut<Dio>(() => Get.find<NetworkManager>().createDio()..addInterceptors(), fenix: true);

  Get.lazyPut(() => GlobalManager(), fenix: true);

  Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(repo: AuthServiceApi(service: AuthService(Get.find<Dio>()))),
      fenix: true);

  Get.lazyPut<MainRepository>(
      () => MainRepositoryImpl(repo: MainServiceApi(service: MainService(Get.find<Dio>()))),
      fenix: true);
}
