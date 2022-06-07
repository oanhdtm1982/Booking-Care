part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class LoadNotification extends NotificationEvent{}

class AddNotification extends NotificationEvent {
  final NotificationModel notification;
  AddNotification(this.notification);
  @override
  List<Object> get props => [notification];
}
class UpdateNotification extends NotificationEvent{
  final NotificationModel notification;
  UpdateNotification(this.notification);
  @override
  List<Object> get props => [notification];
}