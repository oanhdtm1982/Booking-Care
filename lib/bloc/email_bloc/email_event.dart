part of 'email_bloc.dart';

abstract class EmailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendRequested extends EmailEvent {
  final Email email;

  SendRequested(this.email);
}
