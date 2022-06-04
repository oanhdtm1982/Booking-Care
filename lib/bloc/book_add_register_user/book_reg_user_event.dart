part of 'book_reg_user_bloc.dart';

abstract class BookRegUserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadBookingRegUser extends BookRegUserEvent {}

class AddBookingRegUser extends BookRegUserEvent {
  final Booking bookRegUser;
  AddBookingRegUser(this.bookRegUser);
  @override
  List<Object> get props => [bookRegUser];
}