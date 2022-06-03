part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadBooking extends BookingEvent {}

class AddBookingUser extends BookingEvent {
  final Booking booking;
  AddBookingUser(this.booking);
  @override
  List<Object> get props => [booking];
}
