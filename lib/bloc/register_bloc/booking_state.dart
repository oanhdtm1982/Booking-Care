part of 'booking_bloc.dart';

@immutable
abstract class BookingState extends Equatable{
  const BookingState();
  @override
  List<Object> get props => [];
}

class BookingLoading extends BookingState{}

class BookingLoaded extends BookingState{
  final List<Booking> books;
  BookingLoaded(this.books);
  @override
  List<Object> get props => [books];
}

class UnLoadedBooking extends BookingState{
  @override
  List<Object> get props => [];
}

class BookingError extends BookingState{
  final String errors;
  BookingError(this.errors);
  @override
  List<Object> get props => [errors];
}