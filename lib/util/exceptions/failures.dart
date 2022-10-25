import 'package:equatable/equatable.dart';

/// Abstract class that models the most common failures scenarios
abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

/// Server Failure
class ServerFailure extends Failure {
  //TODO: Valores por defecto para no danar sus actuales depedencias
  ServerFailure({this.errorCode = 0, this.detailMessage = ""});

  final String? detailMessage;
  final int? errorCode;
}

/// Server Failure
class UnknowErr extends Failure {
  //TODO: Valores por defecto para no danar sus actuales depedencias
  UnknowErr({this.errorCode = 0, this.detailMessage = ""});

  final String? detailMessage;
  final int? errorCode;
}

/// Internet Connection Failure
class InternetConnectionFailure extends Failure {
  InternetConnectionFailure({this.detailMessage = ""});

  final String? detailMessage;
}

/// Server Failure
class DataFailure extends Failure {}

/// TimeOut Failure
class TimeOutFailure extends Failure {
  TimeOutFailure(
      this.errorCode, {
        this.detailMessage = "",
      });

  final int? errorCode;
  final String? detailMessage;
}

class notFoundFailure extends Failure {
  //TODO: Valores por defecto para no danar sus actuales depedencias
  notFoundFailure({this.errorCode = 0, this.detailMessage = ""});

  final String? detailMessage;
  final int? errorCode;
}
