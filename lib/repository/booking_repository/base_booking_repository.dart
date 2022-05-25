import 'package:doanchuyennganh/Models/Speciality.dart';

import '../../Models/Booking.dart';

abstract class BaseBookingRepository{
  Future<List<Booking>> getAllBooking();
  Future<List<Speciality>> getAllSpeciality();
}