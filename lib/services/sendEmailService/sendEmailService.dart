import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:doanchuyennganh/Models/Email.dart';

class EmailService {
  Future sendEmail({
    required Email email,
  }) async {
    final serviceId = 'service_0gswj4d';
    final templateId = 'template_aduv2p2';
    final userId = 'i1Svcc2g13-xO25f_';
    final accessTokenID = 'ZUf28kPVjqkUyrVIeJX4u';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'accessToken': accessTokenID,
        'template_params': {
          'user_name': email.name, // show display name in gmail
          'to_name': email.toName, // show display name of doctor is sent to
          'user_email': email.email, // my email
          'user_subject': email.subject, // subject of gmail
          'user_message': email.message, // body message
          'to_email': email.toEmail,
        }
      }),
    );
    print(response.body);
  }
}