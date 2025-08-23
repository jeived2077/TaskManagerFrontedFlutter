import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

import 'package:task_manager/ChangePass/PasswordChangeCompleteWidget.dart';

class ChangePassword {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final BuildContext context;
  final PasswordChanged authBackend = PasswordChanged();
  final String email_send;
  final String password;

  ChangePassword({
    required this.context,
    required this.email_send,
    required this.password,
  });

  Future<String?> send_email_code() async {
    try {
      await dotenv.load(fileName: 'env/.env');

      final host = dotenv.env['HOST_API'] ?? '127.0.0.1';
      final port = dotenv.env['PORT_API'] ?? '8080';
      final body = jsonEncode({'email': email_send, 'password': password});


      final headers = {
        HttpHeaders.authorizationHeader: 'Bearer $email_send',
        HttpHeaders.contentTypeHeader: 'application/json',
      };


      final url = Uri.http(
        '$host:$port',
        '/email/change_password_filter_email',
      );


      final response = await http.post(url, headers: headers, body: body);
      final jsonResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final accessToken = jsonResponse['access_token'];
        final refreshToken = jsonResponse['refresh_token'];
        await _storage.write(key: 'access_token', value: accessToken);
        await _storage.write(key: 'refresh_token', value: refreshToken);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => PasswordChanged()),
          (Route<dynamic> route) => false,
        );
        print('Пароль изменился');
        return 'Пароль успешно изменен';
      } else if (response.statusCode == 401) {
        final String errorMessage = jsonResponse['detail'];
        print('Ошибка: $errorMessage');
        return errorMessage;
      } else if (response.statusCode == 422) {
        final List<dynamic>? details = jsonResponse['detail'];
        if (details != null && details.isNotEmpty) {
          final String errorMessage = details[0]['msg'];
          print('Ошибка: $errorMessage');
          return errorMessage;
        } else {
          print('Ошибка: Неизвестная ошибка валидации');
          return 'Неизвестная ошибка валидации';
        }
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
