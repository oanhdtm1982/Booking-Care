part of 'book_reg_bloc.dart';

abstract class BookRegEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class LoadBookingReg extends BookRegEvent{}

class AddBookingReg extends BookRegEvent{
  final BookingRegister bookReg;
  AddBookingReg(this.bookReg);
  @override
  List<Object> get props => [bookReg];
}
