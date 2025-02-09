import 'package:credit_hub_new/src/data/_base/base_barrel.dart';
import 'package:credit_hub_new/src/utils/app_export.dart';
import 'package:dio/dio.dart';

class BaseError implements Exception {
  ErrorResponse? resError;
  DioException? dioError;

  /// The original error/exception object
  dynamic error;

  BaseError({this.resError, this.dioError, this.error});

  String get message {
    String msg = '';
    if (resError != null) {
      final message = resError?.message ?? '';
      if (message.isNotEmpty) {
        msg = message;
      }

      final error = resError?.error ?? '';
      if (msg.isEmpty && error.isNotEmpty) {
        msg = error;
      }
    } else if (dioError != null) {
      msg = dioError.toString();
    } else if (error != null) {
      msg = error.toString();
    }

    return msg.isEmpty ? 'Lỗi xử lý từ server' : msg;
  }

  @override
  String toString() {
    var msg = message;
    if (error is Error) {
      msg = message;
    }
    return msg;
  }
}
