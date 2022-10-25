import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tickets/util/extensions/dio_extension.dart';

import '../../config.dart';
import '../../util/constants/constants.dart';
import '../../util/exceptions/exceptions.dart';
import '../model/ticketModel.dart';

class TicketServices{
  TicketServices(this._dio);

  @override
  void dispose() {}

  @override
  void init() {}

  final _dio;


  Future<List<TicketModel>> getTickets() async {
    final baseUrl = "${ConfigVar.backendBaseUrl.value}Tickets";

    try {
      final response = await _dio.getUri(
        Uri.parse(baseUrl),
      );

      print(baseUrl);

      if (response.statusCode == 200) {

        List<TicketModel> ticketModels = electricitySupplyServicesListFromJson(response.data);

        return ticketModels;

      } else {
        /// When status code is not 200
        throw RestApiException(
          errorCode: response.statusCode,
          errorMessage: response.statusMessage,
        );
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        /// Throws exception caused by internet connection problem
        throw const NoInternetConnectionException(noInternetConnectionMessage);
      } else if (e.isTimeoutError) {
        throw const TimeoutException(errorCode: timeOutStatusCode);
      } else {
        /// Throws Exception when something went wrong in the call
        throw RestApiException(
          errorCode: e.response?.statusCode,
          errorMessage: e.response?.statusMessage,
        );
      }
    }
  }

  Future<TicketModel> getTicket(id) async {
    final baseUrl = "${ConfigVar.backendBaseUrl.value}Tickets/$id";

    try {
      final response = await _dio.getUri(
        Uri.parse(baseUrl),
      );

      print(baseUrl);

      if (response.statusCode == 200) {

        TicketModel ticketModels = TicketModel.fromJson(response.data);

        return ticketModels;

      } else {
        /// When status code is not 200
        throw RestApiException(
          errorCode: response.statusCode,
          errorMessage: response.statusMessage,
        );
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        /// Throws exception caused by internet connection problem
        throw const NoInternetConnectionException(noInternetConnectionMessage);
      } else if (e.isTimeoutError) {
        throw const TimeoutException(errorCode: timeOutStatusCode);
      } else {
        /// Throws Exception when something went wrong in the call
        throw RestApiException(
          errorCode: e.response?.statusCode,
          errorMessage: e.response?.statusMessage,
        );
      }
    }
  }

  Future<bool> UpdateTicket(id,estatus,descripcion,usuario,fechaCreacion) async {
    final baseUrl = "${ConfigVar.backendBaseUrl.value}Tickets/$id";
    DateTime currentDate = DateTime.now();
    String fechaActualizacion = "${currentDate.toString().substring(0, 10)}";
    bool _estatus = estatus.toLowerCase() == 'true';

    try {
      final response = await _dio.put(
        Uri.parse(baseUrl).toString(),
        data: json.encode({
          "id": id,
          "fechaCreacion": fechaCreacion.toString(),
          "fechaActualizacion": fechaActualizacion.toString(),
          "estatus": _estatus,
          "descripcion": descripcion,
          "usuario": usuario
        }),
      );

      if (response.statusCode == 200) {
        return true;

      } else {
        /// When status code is not 200
        throw RestApiException(
          errorCode: response.statusCode,
          errorMessage: response.statusMessage,
        );
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        /// Throws exception caused by internet connection problem
        throw const NoInternetConnectionException(noInternetConnectionMessage);
      } else if (e.isTimeoutError) {
        throw const TimeoutException(errorCode: timeOutStatusCode);
      } else {
        /// Throws Exception when something went wrong in the call
        throw RestApiException(
          errorCode: e.response?.statusCode,
          errorMessage: e.response?.statusMessage,
        );
      }
    }
  }

  Future<bool> deleteTicket(id) async {
    final baseUrl = "${ConfigVar.backendBaseUrl.value}Tickets/$id";

    try {
      final response = await _dio.deleteUri(
        Uri.parse(baseUrl),
      );

      if (response.statusCode == 200) {
        return true;

      } else {
        /// When status code is not 200
        throw RestApiException(
          errorCode: response.statusCode,
          errorMessage: response.statusMessage,
        );
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        /// Throws exception caused by internet connection problem
        throw const NoInternetConnectionException(noInternetConnectionMessage);
      } else if (e.isTimeoutError) {
        throw const TimeoutException(errorCode: timeOutStatusCode);
      } else {
        /// Throws Exception when something went wrong in the call
        throw RestApiException(
          errorCode: e.response?.statusCode,
          errorMessage: e.response?.statusMessage,
        );
      }
    }
  }

  Future<bool> createTicket(estatus,descripcion,usuario) async {
    final baseUrl = "${ConfigVar.backendBaseUrl.value}Tickets/";

    bool _estatus = estatus.toLowerCase() == 'true';
    DateTime currentDate = DateTime.now();
    String fechaCreacion = "${currentDate.toString().substring(0, 10)}";
    String fechaActualizacion = "${currentDate.toString().substring(0, 10)}";

    try {
      final response = await _dio.post(
        Uri.parse(baseUrl).toString(),
        data: json.encode({
          "id": 0,
          "fechaCreacion": fechaCreacion,
          "fechaActualizacion": fechaActualizacion,
          "estatus": _estatus,
          "descripcion": descripcion,
          "usuario": usuario
        }),
      );

      if (response.statusCode == 200) {
        return true;

      } else {
        /// When status code is not 200
        throw RestApiException(
          errorCode: response.statusCode,
          errorMessage: response.statusMessage,
        );
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        /// Throws exception caused by internet connection problem
        throw const NoInternetConnectionException(noInternetConnectionMessage);
      } else if (e.isTimeoutError) {
        throw const TimeoutException(errorCode: timeOutStatusCode);
      } else {
        /// Throws Exception when something went wrong in the call
        throw RestApiException(
          errorCode: e.response?.statusCode,
          errorMessage: e.response?.statusMessage,
        );
      }
    }
  }

}