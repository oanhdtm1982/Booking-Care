import 'package:bloc/bloc.dart';
import 'package:doanchuyennganh/Models/Booking.dart';
import 'package:doanchuyennganh/Models/Doctor.dart';
import 'package:doanchuyennganh/Models/Speciality.dart';
import 'package:doanchuyennganh/repository/booking_repository/bookingRepository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingRepository _bookingRepository;
  BookingBloc({required BookingRepository bookingRepository})
      : _bookingRepository = bookingRepository,
        super(BookingLoading()) {
    on<LoadBooking>((event, emit) async {
      emit(BookingLoading());
      try {
        List<Doctor> listDoctors = await _bookingRepository.getAllDoctor();
        List<Speciality> listSpecialities =
            await _bookingRepository.getAllSpeciality();
        List<Booking> listBooks = await _bookingRepository.getAllBooking();
        emit(BookingLoaded(listBooks, listSpecialities, listDoctors));
      } catch (e) {
        UnLoadedBooking();
        BookingError(e.toString());
      }
    });
  }
}
