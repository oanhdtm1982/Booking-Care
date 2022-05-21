import '../../Models/Booking.dart';

abstract class BaseBookingRepository{
  Future<List<Booking>> getAllBooking();
}