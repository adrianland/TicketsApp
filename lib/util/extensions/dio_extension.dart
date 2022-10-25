import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

/// Dio Error Extension
extension DioErrorX on DioError {
  /// Check if there is internet connection
  bool get isNoConnectionError {
    return type == DioErrorType.other && error is SocketException;
  }

  bool get isTimeoutError {
    return type == DioErrorType.other && error is TimeoutException;
  }

  bool get isConnectTimeout {
    return type == DioErrorType.connectTimeout;
  }

  bool get noConnectionError {
    return type is SocketException;
  }
}
