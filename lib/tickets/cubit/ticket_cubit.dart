import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../util/exceptions/failures.dart';
import '../model/ticketModel.dart';
import '../repository/ticket_repository.dart';

part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit(this.ticketRepository) : super(TicketInitial());

  final TicketRepository ticketRepository;

  Future<void> getTickets() async {
    emit(TicketLoading());

    final result = await ticketRepository.getTickets();
    print(result);
    result.fold(
          (Failure failure) => handleFailure(failure),
          (data) {
        if (data.isEmpty) {
          emit(TicketEmpty());
        } else {
          emit(TicketLoadingSuccess(tickets: data));
        }
      },
    );
  }

  Future<void> getTicket(id) async {
    emit(TicketLoading());

    final result = await ticketRepository.getTicket(id);
    print(result);
    result.fold(
          (Failure failure) => handleFailure(failure),
          (data) {
        if (data != null) {

          List<TicketModel> ticket = [];
          ticket.add(data);

          emit(TicketLoadingSuccess(tickets: ticket));
        } else {
          emit(TicketEmpty());
        }
      },
    );
  }

  Future<void> updateTicket(id,estatus,descripcion,usuario,fechaCreacion) async {
    emit(TicketLoading());

    final result = await ticketRepository.UpdateTicket(id,estatus,descripcion,usuario,fechaCreacion);

    result.fold(
          (Failure failure) => handleFailure(failure),
          (data) {
        if (data) {
          emit(TicketUpdated());
        }
      },
    );
  }

  Future<void> deleteTicket(id) async {
    emit(TicketLoading());

    final result = await ticketRepository.deleteTicket(id);

    result.fold(
          (Failure failure) => handleFailure(failure),
          (data) {
        if (data) {
          emit(TicketUpdated());
        }
      },
    );
  }

  Future<void> createTicket(estatus,descripcion,usuario) async {
    emit(TicketLoading());

    final result = await ticketRepository.createTicket(estatus,descripcion,usuario);

    result.fold(
          (Failure failure) => handleFailure(failure),
          (data) {
        if (data) {
          emit(TicketUpdated());
        }
      },
    );
  }

  void handleFailure(Failure failure) {
    if (failure is TimeOutFailure) {
      return emit(TicketSetTimeOut(statusCode: -1,errorMessage: failure.detailMessage!));
    } else if (failure is ServerFailure) {
      return emit(TicketServerError(statusCode: -1,errorMessage: failure.detailMessage!));
    } else if (failure is InternetConnectionFailure) {
      emit(TicketConnectionError(statusCode: -1,errorMessage: failure.detailMessage!));
    } else if (failure is UnknowErr) {
      return emit(TicketUnknownError(statusCode: -1,errorMessage: failure.detailMessage!));
    }
  }

}
