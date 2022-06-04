part of 'email_information_register_bloc.dart';

abstract class EmailRegUserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadEmailRegUser extends EmailRegUserEvent {}

class AddEmailRegUser extends EmailRegUserEvent {
  final Booking emailRegUser;
  AddEmailRegUser(this.emailRegUser);
  @override
  List<Object> get props => [emailRegUser];
}