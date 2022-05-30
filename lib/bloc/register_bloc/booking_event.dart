part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class LoadBooking extends BookingEvent{}
