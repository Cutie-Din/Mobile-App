import 'dart:developer';
import 'dart:io';

import 'package:credit_hub_new/config/app_config.dart';
import 'package:credit_hub_new/src/shared/app_manager.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as g;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkManager {
  final String proxy = AppConfig.proxy;

  BaseOptions opts = BaseOptions(
    baseUrl: AppConfig.url,
    contentType: 'application/json',
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );

  // BaseOptions optsGoogleMap = BaseOptions(
  //   baseUrl: '',
  //   contentType: 'application/json',
  //   connectTimeout: const Duration(seconds: 30),
  //   receiveTimeout: const Duration(seconds: 30),
  // );

  Dio createDio() {
    return createDioWith(opts).addInterceptors();
  }

  // Dio createDioGoogleMaps() {
  //   return Dio(optsGoogleMap);
  // }

  Dio createDioWith(BaseOptions opts) {
    final dio = Dio(opts);

    // // add proxy debugable base on https://flutterigniter.com/debugging-network-requests/
    if (kDebugMode) {
      if (proxy.isEmpty) {
        return dio;
      }

      dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();
          client.findProxy = (uri) {
            // Proxy all request to localhost:8888.
            // Be aware, the proxy should went through you running device,
            // not the host platform.
            return 'PROXY $proxy';
          };
          client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
          return client;
        },
      );
    }

    return dio;
  }
}

extension AppAppDioExtension on Dio {
  Dio addInterceptors() {
    return this
      ..interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(InterceptorsWrapper(
          onRequest: requestInterceptor,
          onResponse: responseInterceptor,
          onError: errorInterceptor));
  }

  Future<void> requestInterceptor(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = await _getAccessToken(); // ✅ Kiểm tra token ở đây
      log('🔍 Token lấy từ local: $token');

      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = '$token';
        log('✅ Token đã được thêm vào headers: ${options.headers}');
      } else {
        log('⚠️ Token NULL hoặc RỖNG! Không thể thêm vào headers.');
      }

      handler.next(options); // Tiếp tục request
    } catch (e) {
      log('❌ [Request Interceptor Error]: $e');
      handler.next(options);
    }
  }

  Future responseInterceptor(Response response, ResponseInterceptorHandler handler) async {
    try {
      final token = await _getAccessToken();
      log('token: Bearer $token\n ${response.data?['message']}');

      return handler.next(response);
    } catch (e) {
      return handler.next(response);
    }
  }

  Future<void> errorInterceptor(DioException error, ErrorInterceptorHandler handler) async {
    try {
      final isSignIn = await g.Get.find<AppManager>().getSignedInStatus();

      if (error.response?.statusCode == 401 && isSignIn) {
        await _refreshToken();

        // Lấy lại token mới và gắn vào header
        final newAccessToken = _getAccessToken();
        error.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

        // Gửi lại request cũ với token mới
        final newRequest = await fetch(error.requestOptions);
        return handler.resolve(newRequest);
      } else {
        handler.next(error);
      }
    } catch (e) {
      handler.next(error);
    }
  }

  // Function để refresh token
  Future<void> _refreshToken() async {
    final refreshToken = await _getRefreshToken(); // Lấy refresh token từ storage

    final response = await get(
      '${AppConfig.url}/refresh-token/$refreshToken',
    );
    final String token = response.data;
    _saveToken(token);
  }

  // Lấy refresh token từ storage
  Future<String> _getRefreshToken() async {
    final String? token = await g.Get.find<AppManager>().getToken();
    return token ?? '';
  }

  // Lấy access token từ storage
  Future<String> _getAccessToken() async {
    final String? token = await g.Get.find<AppManager>().getToken();
    return token ?? '';
  }

  void _saveToken(String token) {
    g.Get.find<AppManager>().saveToken(token: token);
  }
}
