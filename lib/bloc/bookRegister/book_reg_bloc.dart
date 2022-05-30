import 'package:bloc/bloc.dart';
import 'package:doanchuyennganh/Models/BookingRegister.dart';
import 'package:doanchuyennganh/repository/booking_repository/bookingRepository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'book_reg_event.dart';
part 'book_reg_state.dart';

class BookRegBloc extends Bloc<BookRegEvent,BookRegState>{
  final BookingRepository _bookingRepository;
  BookRegBloc({required BookingRepository bookingRepository})
      : _bookingRepository = bookingRepository,
        super(BookRegLoading()){
    on<LoadBookingReg>((event,emit) async{
      try{
        List<BookingRegister> listBookingReg = await _bookingRepository.getAllBookingRegister();
        emit(BookRegLoaded(listBookingReg));
      }catch(e){
        UnLoadedBookingReg();
        BookRegError(e.toString());
      }
    });
    on<AddBookingReg>((event,emit) async{
      try{
        final state = this.state as BookRegLoaded;
        _bookingRepository.addBookingRegister(event.bookReg);
        emit(BookRegLoaded(List.from(state.bookRegs)..add(event.bookReg)));
      }catch(e){
        UnLoadedBookingReg();
        BookRegError(e.toString());
      }
    });
  }
}

