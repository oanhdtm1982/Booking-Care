part of 'book_reg_user_bloc.dart';

@immutable
abstract class BookRegUserState extends Equatable {
  const BookRegUserState();
  @override
  List<Object> get props => [];
}

class BookRegUserLoading extends BookRegUserState {}

class BookRegUserLoaded extends BookRegUserState {
  final List<Booking> bookRegsUser;
  BookRegUserLoaded(this.bookRegsUser);
  List<Object> get props => [bookRegsUser];
}

class UnLoadedBookingReg extends BookRegUserState {
  @override
  List<Object> get props => [];
}

class BookRegUserError extends BookRegUserState {
  final String errors;
  BookRegUserError(this.errors);
  @override
  List<Object> get props => [errors];
}
