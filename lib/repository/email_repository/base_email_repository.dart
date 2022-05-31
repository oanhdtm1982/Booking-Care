
import '../../Models/Email.dart';

abstract class BaseEmailRepository{
  Future<void> sendEmailToDoctor(Email email);
}