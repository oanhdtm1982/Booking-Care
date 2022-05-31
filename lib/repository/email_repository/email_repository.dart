
import 'package:doanchuyennganh/Models/Email.dart';
import 'package:doanchuyennganh/repository/email_repository/base_email_repository.dart';
import 'package:doanchuyennganh/services/sendEmailService/sendEmailService.dart';

class EmailRepository extends BaseEmailRepository{
  EmailService _emailService = EmailService();
  Future<void> sendEmailToDoctor(Email email)async{
    return await _emailService.sendEmail(email: email);
  }
}