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
  final List<Speciality> spec;
  BookingLoaded(this.books,this.spec);
  @override
  List<Object> get props => [books,spec];
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