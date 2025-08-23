import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

import 'OtpVerificationWidget.dart';

class SendEmail {
  final BuildContext context;
  final OtpVerification authBackend = OtpVerification(
    correctOtp: '',
    email_send: '',
  );
  final String email_send;

  SendEmail(this.email_send, {required this.context});

  Future<String?> send_email_code() async {
    try {
      await dotenv.load(fileName: 'env/.env');

      final host = dotenv.env['HOST_API'] ?? '127.0.0.1';
      final port = dotenv.env['PORT_API'] ?? '8080';

      final headers = {HttpHeaders.authorizationHeader: 'Bearer $email_send'};
      final queryParams = {'email': email_send};
      final url = Uri.http(
        '$host:$port',
        '/email/send_email_to_code',
        queryParams,
      );

      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        String code = response.body.replaceAll('"', '');
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) =>
                OtpVerification(correctOtp: code, email_send: email_send),
          ),
          (Route<dynamic> route) => false,
        );
        print('Полученный код: $code');
        return code;
      } else if (response.statusCode == 401) {
        print('Авторизация не успешна: ${response.body}');
        return null;
      } else {
        print('Ошибка отправки сообщения на почту: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Ошибка выполнения: $e');
      return null;
    }
  }
}
