import 'dart:io';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart'; // Добавляем импорт для Navigator
import '../auth/AutorizationWidget.dart'; // Предполагается, что это ваш виджет авторизации
import '../main.dart'; // Предполагается, что 'main.dart' содержит класс Task
import '../Home/homeWidget.dart';

import 'Autorization.dart';

// Класс для работы с задачами, который зависит от авторизации.
// Он тоже больше не содержит UI-логики.
class TaskClass {
  final BuildContext context;
  final AuthorizationBackend authBackend = AuthorizationBackend();

  TaskClass({required this.context});

  // Метод для получения списка задач. Возвращает список задач или null, если что-то пошло не так.
  Future<List<Task>?> writeLineTask() async {
    try {
      await dotenv.load(fileName: 'env/.env');

      String? jwt = await authBackend.getValidToken();

      if (jwt == null) {
        // Если getValidToken вернул null, это означает, что даже refresh-токен не сработал.
        // Это идеальный момент, чтобы перенаправить пользователя.
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Autification()),
              (Route<dynamic> route) => false,
        );
        return null;
      }

      final host = dotenv.env['HOST_API'] ?? '127.0.0.1';
      final port = dotenv.env['PORT_API'] ?? '8080';
      final url = Uri.http('$host:$port', '/tasks/');

      final headers = {HttpHeaders.authorizationHeader: 'Bearer $jwt'};
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => Task.fromJson(json)).toList();
      } else if (response.statusCode == 401) {
        // Явно проверяем статус 401, даже если токен был,
        // так как он мог оказаться недействительным по другой причине.
        // Перенаправляем на страницу авторизации.
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Autification()),
              (Route<dynamic> route) => false,
        );
        return null;
      } else {
        // Для всех остальных ошибок просто возвращаем null.
        return null;
      }
    } catch (e) {
      // При любой непредвиденной ошибке возвращаем null.
      print('Ошибка при выполнении запроса: $e');
      return null;
    }
  }
}
