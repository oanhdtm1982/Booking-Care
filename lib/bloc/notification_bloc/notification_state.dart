part of 'notification_bloc.dart';

@immutable
abstract class NotificationState extends Equatable{
  const NotificationState();
  @override
  List<Object> get props => [];
}

class NotificationLoading extends NotificationState{}

class NotificationLoaded extends NotificationState{
  final List<NotificationModel> notifications;
  NotificationLoaded(this.notifications);
  @override
  List<Object> get props => [notifications];
}

class UnLoadedNotification extends NotificationState{
  @override
  List<Object> get props => [];
}

class NotificationError extends NotificationState{
  final String errors;
  NotificationError(this.errors);
  @override
  List<Object> get props => [errors];
}