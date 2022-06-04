part of 'email_information_register_bloc.dart';

@immutable
abstract class EmailRegUserState extends Equatable {
  const EmailRegUserState();
  @override
  List<Object> get props => [];
}

class EmailRegUserLoading extends EmailRegUserState {}

class EmailRegUserLoaded extends EmailRegUserState {
  final List<Booking> emailRegUsers;
  EmailRegUserLoaded(this.emailRegUsers);
  List<Object> get props => [emailRegUsers];
}

class UnLoadedEmailRegUser extends EmailRegUserState {
  @override
  List<Object> get props => [];
}

class EmailRegUserError extends EmailRegUserState {
  final String errors;
  EmailRegUserError(this.errors);
  @override
  List<Object> get props => [errors];
}