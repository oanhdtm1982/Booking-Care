import 'package:doanchuyennganh/Models/Notification.dart';

abstract class BaseNotificationRepository{
  Future<List<NotificationModel>> getNotificationData();
  Future<void> addNotification(NotificationModel notification);
  Future<void> updateConfirmNotification(NotificationModel notification);
}