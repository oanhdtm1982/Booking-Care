import 'package:bloc/bloc.dart';
import 'package:doanchuyennganh/repository/booking_repository/bookingRepository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../Models/Booking.dart';

part 'book_reg_user_event.dart';
part 'book_reg_user_state.dart';

class BookRegUserBloc extends Bloc<BookRegUserEvent, BookRegUserState> {
  final BookingRepository _bookingRepository;
  BookRegUserBloc({required BookingRepository bookingRepository})
      : _bookingRepository = bookingRepository,
        super(BookRegUserLoading()) {
    on<LoadBookingRegUser>((event, emit) async {
      try {
        List<Booking> listBookingRegUser =
            await _bookingRepository.getAllBooking();
        emit(BookRegUserLoaded(listBookingRegUser));
      } catch (e) {
        UnLoadedBookingReg();
        BookRegUserError(e.toString());
      }
    });
    on<AddBookingRegUser>((event, emit) async {
      try {
        final state = this.state as BookRegUserLoaded;
        _bookingRepository.addBookingUser(event.bookRegUser);
        emit(BookRegUserLoaded(
            List.from(state.bookRegsUser)..add(event.bookRegUser)));
      } catch (e) {
        UnLoadedBookingReg();
        BookRegUserError(e.toString());
      }
    });
  }
}