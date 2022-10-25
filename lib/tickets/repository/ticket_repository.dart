import 'package:dartz/dartz.dart';
import 'package:tickets/tickets/repository/ticket_services.dart';
import '../../util/exceptions/exceptions.dart';
import '../../util/exceptions/failures.dart';
import '../model/ticketModel.dart';

class TicketRepository{
  TicketRepository(this._ticketServices);

   final TicketServices _ticketServices;

  Future<Either<Failure, List<TicketModel>>> getTickets() async {
    try {
      final response = await _ticketServices.getTickets();
      return right(response);
    } on RestApiException {
      return left(ServerFailure());
    }on UnknowError catch (e) {
      return left(UnknowErr(errorCode: e.errorCode,detailMessage: e.errorMessage));
    } on NoInternetConnectionException catch (e) {
      return left(InternetConnectionFailure(detailMessage: e.message));
    } on TimeoutException catch (e) {
      return left(TimeOutFailure(e.errorCode,detailMessage: e.errorMessage));
    }
  }

  Future<Either<Failure, TicketModel>> getTicket(id) async {
    try {
      final response = await _ticketServices.getTicket(id);
      return right(response);
    } on RestApiException  catch (e) {
      return left(ServerFailure(errorCode: e.errorCode,detailMessage: e.errorMessage));
    }on UnknowError catch (e) {
      return left(UnknowErr(errorCode: e.errorCode,detailMessage: e.errorMessage));
    } on NoInternetConnectionException catch (e) {
      return left(InternetConnectionFailure(detailMessage: e.message));
    } on TimeoutException catch (e) {
      return left(TimeOutFailure(e.errorCode,detailMessage: e.errorMessage));
    }
  }

  Future<Either<Failure, bool>> UpdateTicket(id,estatus,descripcion,usuario,fechaCreacion) async {
    try {
      final response = await _ticketServices.UpdateTicket(id,estatus,descripcion,usuario,fechaCreacion);
      return right(response);
    } on RestApiException {
      return left(ServerFailure());
    }on UnknowError catch (e) {
      return left(UnknowErr(errorCode: e.errorCode,detailMessage: e.errorMessage));
    } on NoInternetConnectionException catch (e) {
      return left(InternetConnectionFailure(detailMessage: e.message));
    } on TimeoutException catch (e) {
      return left(TimeOutFailure(e.errorCode,detailMessage: e.errorMessage));
    }
  }

  Future<Either<Failure, bool>> deleteTicket(id) async {
    try {
      final response = await _ticketServices.deleteTicket(id);
      return right(response);
    } on RestApiException {
      return left(ServerFailure());
    }on UnknowError catch (e) {
      return left(UnknowErr(errorCode: e.errorCode,detailMessage: e.errorMessage));
    } on NoInternetConnectionException catch (e) {
      return left(InternetConnectionFailure(detailMessage: e.message));
    } on TimeoutException catch (e) {
      return left(TimeOutFailure(e.errorCode,detailMessage: e.errorMessage));
    }
  }

  Future<Either<Failure, bool>> createTicket(estatus,descripcion,usuario) async {
    try {
      final response = await _ticketServices.createTicket(estatus,descripcion,usuario);
      return right(response);
    } on RestApiException {
      return left(ServerFailure());
    }on UnknowError catch (e) {
      return left(UnknowErr(errorCode: e.errorCode,detailMessage: e.errorMessage));
    } on NoInternetConnectionException catch (e) {
      return left(InternetConnectionFailure(detailMessage: e.message));
    } on TimeoutException catch (e) {
      return left(TimeOutFailure(e.errorCode,detailMessage: e.errorMessage));
    }
  }

}