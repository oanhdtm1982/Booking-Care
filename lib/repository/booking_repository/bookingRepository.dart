import 'package:doanchuyennganh/repository/booking_repository/base_booking_repository.dart';
import 'package:doanchuyennganh/services/BookingService/BookingService.dart';

import '../../Models/Booking.dart';

class BookingRepository extends BaseBookingRepository{
  BookingService service = BookingService();
  @override
  Future<List<Booking>> getAllBooking() async{
    return service.retrieveBookingData();
  }
}