import 'package:bloc/bloc.dart';
import 'package:doanchuyennganh/repository/email_repository/email_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../Models/Email.dart';

part 'email_state.dart';
part 'email_event.dart';

class EmailBloc extends Bloc<EmailEvent,EmailState>{
  final EmailRepository _emailRepository;
  EmailBloc({required EmailRepository emailRepository})
  : _emailRepository = emailRepository,
  super(EmailLoading()){
    on<SendRequested>((event,emit) async{
        emit(EmailLoading());
        try{
          await _emailRepository.sendEmailToDoctor(event.email);
          emit(Sended());
        }catch(e){
          UnSended();
          SendError(e.toString());
        }
    });
  }
}