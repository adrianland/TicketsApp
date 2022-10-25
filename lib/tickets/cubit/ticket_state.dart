part of 'ticket_cubit.dart';

abstract class TicketState extends Equatable {
  const TicketState();

  @override
  List<Object> get props => [];
}

class TicketInitial extends TicketState {}

class TicketLoading extends TicketState {}

class TicketUpdated extends TicketState {}

class TicketLoadingSuccess extends TicketState {
  final List<TicketModel> tickets;
  const TicketLoadingSuccess({required this.tickets});
}

class TicketLoadedFailed extends TicketState {
  final String message;

  const TicketLoadedFailed(
      this.message,
      );

  @override
  List<Object> get props => [message];
}

class TicketSetTimeOut extends TicketState {
  final int statusCode;
  final String errorMessage;
  const TicketSetTimeOut({required this.errorMessage,required this.statusCode});

  @override
  List<Object> get props => [errorMessage];
}

class TicketEmpty extends TicketState {}

class TicketUnknownError extends TicketState {
  final int statusCode;
  final String errorMessage;
  const TicketUnknownError({required this.errorMessage,required this.statusCode});

  @override
  List<Object> get props => [errorMessage];
}

class TicketConnectionError extends TicketState {
  final int statusCode;
  final String errorMessage;
  const TicketConnectionError({required this.errorMessage,required this.statusCode});

  @override
  List<Object> get props => [errorMessage];
}

class TicketServerError extends TicketState {
  final int statusCode;
  final String errorMessage;
  const TicketServerError({required this.errorMessage,required this.statusCode});
}
