part of 'email_bloc.dart';

@immutable
abstract class EmailState extends Equatable {}

// When the user presses the signin or signup button the state is changed to loading first and then to Authenticated.
class EmailLoading extends EmailState {
  @override
  List<Object?> get props => [];
}

// When the user is authenticated the state is changed to Authenticated.
class Sended extends EmailState {
  @override
  List<Object?> get props => [];
}

// This is the initial state of the bloc. When the user is not authenticated the state is changed to Unauthenticated.
class UnSended extends EmailState {
  @override
  List<Object?> get props => [];
}

// If any error occurs the state is changed to AuthError.
class SendError extends EmailState {
  final String error;

  SendError(this.error);
  @override
  List<Object?> get props => [error];
}