import 'package:doanchuyennganh/Models/BookingRegister.dart';
import 'package:doanchuyennganh/Models/Speciality.dart';

import '../../Models/Booking.dart';

abstract class BaseBookingRepository{
  Future<List<Booking>> getAllBooking();
  Future<List<Speciality>> getAllSpeciality();
  Future<List<BookingRegister>> getAllBookingRegister();
  Future<void>addBookingRegister(BookingRegister bookReg);
}