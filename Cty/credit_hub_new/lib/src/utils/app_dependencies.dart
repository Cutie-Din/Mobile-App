import 'package:credit_hub_new/src/data/_base/base_barrel.dart';
import 'package:credit_hub_new/src/data/repository/auth/auth_repository.dart';
import 'package:credit_hub_new/src/data/repository/auth/auth_repository_impl.dart';
import 'package:credit_hub_new/src/data/service/service_barrel.dart';
import 'package:credit_hub_new/src/utils/app_export.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

void provideDependencies() {
  Get.put(AppManager());

  Get.put(NetworkManager());

  Get.lazyPut<Dio>(() => Get.find<NetworkManager>().createDio()..addInterceptors(), fenix: true);

  Get.lazyPut(() => GlobalManager(), fenix: true);

  Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(repo: AuthServiceApi(service: AuthService(Get.find<Dio>()))),
      fenix: true);

  // Get.lazyPut<HomeRepository>(
  //     () => HomeRepositoryImpl(repo: HomeServiceApi(service: HomeService(Get.find<Dio>()))),
  //     fenix: true);
}
