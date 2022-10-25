/// Exception when there is not internet connection
class NoInternetConnectionException implements Exception {
  /// Constructor
  const NoInternetConnectionException(this.message);

  /// Error message
  final String message;
}

/// Exceptions caused when calling Enerbit API
class RestApiException implements Exception {
  /// Constructor
  const RestApiException({this.errorCode, this.errorMessage});

  /// Error Status Code
  final int? errorCode;

  /// Error message
  final String? errorMessage;
}

/// Exceptions caused when calling Enerbit API
class TimeoutException implements Exception {
  /// Constructor
  const TimeoutException({required this.errorCode, this.errorMessage});

  /// Error Status Code
  final int errorCode;

  /// Error message
  final String? errorMessage;
}

class UnknowError implements Exception {
  /// Constructor
  const UnknowError({required this.errorCode, this.errorMessage});

  /// Error Status Code
  final int errorCode;

  /// Error message
  final String? errorMessage;
}
