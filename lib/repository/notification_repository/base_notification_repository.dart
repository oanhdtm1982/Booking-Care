import 'package:doanchuyennganh/Models/Notification.dart';

abstract class BaseNotificationRepository{
  Future<List<NotificationModel>> getNotificationData();
}