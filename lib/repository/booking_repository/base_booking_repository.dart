import 'package:doanchuyennganh/Models/BookingRegister.dart';
import 'package:doanchuyennganh/Models/Doctor.dart';
import 'package:doanchuyennganh/Models/Speciality.dart';

import '../../Models/Booking.dart';

abstract class BaseBookingRepository {
  Future<List<Booking>> getAllBooking();
  Future<List<Doctor>> getAllDoctor();
  Future<List<Speciality>> getAllSpeciality();
  Future<List<BookingRegister>> getAllBookingRegister();
  Future<void> addBookingUser(Booking book);
  Future<void> addBookingRegister(BookingRegister bookReg);
}
