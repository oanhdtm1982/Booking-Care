import 'package:bloc/bloc.dart';
import 'package:doanchuyennganh/Models/Notification.dart';
import 'package:doanchuyennganh/repository/notification_repository/notification_repository.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent,NotificationState>{
  final NotificationRepository _notificationRepository;
  NotificationBloc({required  notificationRepository})
      : _notificationRepository = notificationRepository,
        super(NotificationLoading()){
    on<LoadNotification>((event,emit) async{
      emit(NotificationLoading());
      try{
        List<NotificationModel> listNotifications = await _notificationRepository.getNotificationData();
        emit(NotificationLoaded(listNotifications));
      }catch(e){
        UnLoadedNotification();
        NotificationError(e.toString());
      }
    });
    on<AddNotification>((event, emit) async {
      try {
        final state = this.state as NotificationLoaded;
        _notificationRepository.addNotification(event.notification);
        emit(NotificationLoaded(
            List.from(state.notifications)..add(event.notification)));
      } catch (e) {
        UnLoadedNotification();
        NotificationError(e.toString());
      }
    });
    on<UpdateNotification>((event,emit) async{
      try{
        _notificationRepository.updateConfirmNotification(event.notification);
      } catch(e){
        UnLoadedNotification();
        NotificationError(e.toString());
      }
    });
  }
}

