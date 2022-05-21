part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class LoadBooking extends BookingEvent{}

class AddBooking extends BookingEvent{
  final Booking book;
  AddBooking(this.book);
  @override
  List<Object> get props => [book];
}

class UpdateBooking extends BookingEvent{
  final Booking book;
  UpdateBooking(this.book);
  @override
  List<Object> get props => [book];
}

class DeleteBooking extends BookingEvent{
  final Booking book;
  DeleteBooking(this.book);
  @override
  List<Object> get props => [book];
}