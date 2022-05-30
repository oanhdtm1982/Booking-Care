part of 'book_reg_bloc.dart';

@immutable
abstract class BookRegState extends Equatable{
  const BookRegState();
  @override
  List<Object> get props => [];
}
class BookRegLoading extends BookRegState{}
class BookRegLoaded extends BookRegState{
  final List<BookingRegister> bookRegs;
  BookRegLoaded(this.bookRegs);
  List<Object> get props => [bookRegs];
}
class UnLoadedBookingReg extends BookRegState{
  @override
  List<Object> get props => [];
}

class BookRegError extends BookRegState{
  final String errors;
  BookRegError(this.errors);
  @override
  List<Object> get props => [errors];
}