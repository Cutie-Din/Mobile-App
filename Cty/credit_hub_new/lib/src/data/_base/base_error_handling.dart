import 'dart:io';

import 'package:credit_hub_new/src/data/_base/api_exception.dart';
import 'package:credit_hub_new/src/utils/app_export.dart';
import 'package:dio/dio.dart';

Exception handleError(String error) {
  return ApiException(message: error);
}

Exception handleDioError(DioException dioError) {
  int statusCode = dioError.response?.statusCode ?? -1;
  int? status;
  String? serverMessage;

  try {
    status = dioError.response?.data['status'];
    serverMessage = dioError.response?.data['title'];
  } catch (e, _) {
    serverMessage = 'Something went wrong. Please try again later.';
  }
  switch (statusCode) {
    case HttpStatus.badRequest: // 400
      return ApiException(
        httpCode: statusCode,
        status: status?.toString(),
        message: 'Bad Request',
      );
    case HttpStatus.unauthorized: // 401
      return ApiException(
        httpCode: statusCode,
        status: status?.toString(),
        message: 'Unauthorized. Please check your credentials.',
      );
    case HttpStatus.notFound: // 404
      return ApiException(
        httpCode: statusCode,
        status: status?.toString(),
        message: 'Resource not found.',
      );
    case HttpStatus.internalServerError: // 500
      return ApiException(
        httpCode: statusCode,
        status: status?.toString(),
        message: 'Internal Server Error. Please try again later.',
      );
    case HttpStatus.serviceUnavailable:
      return ApiException(message: 'Service Temporarily Unavailable');
    case HttpStatus.notFound:
      return ApiException(message: serverMessage ?? '');
    default:
      return ApiException(
          httpCode: statusCode, status: status.toString(), message: serverMessage ?? '');
  }
}
