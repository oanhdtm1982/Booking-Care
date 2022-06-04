import 'package:bloc/bloc.dart';
import 'package:doanchuyennganh/repository/booking_repository/bookingRepository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../Models/Booking.dart';

part 'email_information_register_event.dart';
part 'email_information_register_state.dart';

class EmailRegUserBloc extends Bloc<EmailRegUserEvent, EmailRegUserState> {
  final BookingRepository _bookingRepository;
  EmailRegUserBloc({required BookingRepository bookingRepository})
      : _bookingRepository = bookingRepository,
        super(EmailRegUserLoading()) {
    on<LoadEmailRegUser>((event, emit) async {
      try {
        List<Booking> listEmailRegUser =
            await _bookingRepository.getAllBooking();
        emit(EmailRegUserLoaded(listEmailRegUser));
      } catch (e) {
        UnLoadedEmailRegUser();
        EmailRegUserError(e.toString());
      }
    });
    on<AddEmailRegUser>((event, emit) async {
      try {
        final state = this.state as EmailRegUserLoaded;
        _bookingRepository.addBookingUser(event.emailRegUser);
        emit(EmailRegUserLoaded(
            List.from(state.emailRegUsers)..add(event.emailRegUser)));
      } catch (e) {
        UnLoadedEmailRegUser();
        EmailRegUserError(e.toString());
      }
    });
  }
}