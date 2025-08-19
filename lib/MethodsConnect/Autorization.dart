import 'dart:io';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';



class AuthorizationBackend {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AuthorizationBackend();


  Future<String?> register({
    required String login,
    required String password,
    required String email,
    String role = 'member',
  }) async {
    try {
      await dotenv.load(fileName: 'env/.env');
      final host = dotenv.env['HOST_API'] ?? 'localhost';

      final port = dotenv.env['PORT_API'] ?? '8000';
      final url = Uri.http('$host:$port', '/auth/registr');
      final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
      final body = jsonEncode({
        'login': login,
        'password': password,
        'email': email,
        'role': role,
      });

      print('Отправка запроса на регистрацию на URL: $url');
      print('Тело запроса: $body');

      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      print('Ответ сервера на регистрацию: ${response.statusCode} - ${response.reasonPhrase}');

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final accessToken = jsonResponse['access_token'];
        final refreshToken = jsonResponse['refresh_token'];
        await _storage.write(key: 'access_token', value: accessToken);
        await _storage.write(key: 'refresh_token', value: refreshToken);
        return null;
      } else {
        return 'Ошибка регистрации: ${response.reasonPhrase}';
      }
    } catch (e) {
      print('Произошла ошибка в register: $e');
      return 'Произошла ошибка, попробуйте позже.';
    }
  }


  Future<String?> auth({
    required String login,
    required String password,
  }) async {
    try {
      await dotenv.load(fileName: 'env/.env');
      final host = dotenv.env['HOST_API'] ?? 'localhost';

      final port = dotenv.env['PORT_API'] ?? '8000';
      final url = Uri.http('$host:$port', '/auth/login');
      final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
      final body = jsonEncode({'login': login, 'password': password});

      print('Отправка запроса на авторизацию на URL: $url');
      print('Тело запроса: $body');

      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      print('Ответ сервера на авторизацию: ${response.statusCode} - ${response.reasonPhrase}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final String newAccessToken = data['access_token'];
        final String newRefreshToken = data['refresh_token'];
        await _storage.write(key: 'access_token', value: newAccessToken);
        await _storage.write(key: 'refresh_token', value: newRefreshToken);
        return null; // Успех
      } else {
        return 'Ошибка авторизации. Проверьте логин и пароль.';
      }
    } catch (e) {
      print('Произошла ошибка в auth: $e');
      return 'Произошла ошибка, попробуйте позже.';
    }
  }


  Future<String?> refreshToken() async {
    try {
      await dotenv.load(fileName: 'env/.env');
      final host = dotenv.env['HOST_API'] ?? 'localhost';
      // ИСПРАВЛЕНО: Устанавливаем порт 8000
      final port = dotenv.env['PORT_API'] ?? '8000';
      final refreshToken = await _storage.read(key: 'refresh_token');

      if (refreshToken == null) {
        await _storage.deleteAll();
        return null;
      }

      final url = Uri.http('$host:$port', '/auth/refresh');
      final headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $refreshToken',
      };

      print('Отправка запроса на обновление токена на URL: $url');

      final response = await http.post(url, headers: headers);

      print('Ответ сервера на обновление токена: ${response.statusCode} - ${response.reasonPhrase}');

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final newAccessToken = jsonResponse['access_token'];
        await _storage.write(key: 'access_token', value: newAccessToken);
        return newAccessToken;
      } else {
        // Если refresh-токен истёк, удаляем токены и возвращаем null.
        await _storage.delete(key: 'access_token');
        await _storage.delete(key: 'refresh_token');
        return null;
      }
    } catch (e) {
      print('Произошла ошибка в refreshToken: $e');
      await _storage.deleteAll();
      return null;
    }
  }


  Future<String?> getValidToken() async {
    String? accessToken = await _storage.read(key: 'access_token');
    if (accessToken == null) {
      return await refreshToken();
    }
    return accessToken;
  }


  Future<String?> changePassword({
    required String newPassword,
  }) async {
    try {
      await dotenv.load(fileName: 'env/.env');
      String? jwt = await getValidToken();
      if (jwt == null) {
        return 'Session expired. Please log in again.';
      }

      final host = dotenv.env['HOST_API'] ?? 'localhost';
      // ИСПРАВЛЕНО: Устанавливаем порт 8000
      final port = dotenv.env['PORT_API'] ?? '8000';
      final url = Uri.http('$host:$port', '/auth/change_password');
      final headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $jwt',
      };
      final body = jsonEncode({'password': newPassword});

      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        return null; // Успех
      } else {
        return 'Ошибка изменения пароля: ${response.reasonPhrase}';
      }
    } catch (e) {
      return 'Произошла ошибка при изменении пароля';
    }
  }


  Future<String?> changeAvatar({
    required File avatarFile,
  }) async {
    try {
      await dotenv.load(fileName: 'env/.env');
      String? jwt = await getValidToken();
      if (jwt == null) {
        return 'Session expired. Please log in again.';
      }

      final host = dotenv.env['HOST_API'] ?? 'localhost';

      final port = dotenv.env['PORT_API'] ?? '8000';
      final url = Uri.http('$host:$port', '/auth/change_avatar');

      var request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] = 'Bearer $jwt';
      request.files.add(await http.MultipartFile.fromPath('avatar', avatarFile.path));

      final response = await request.send();

      if (response.statusCode == 200) {
        return null; // Успех
      } else {
        return 'Ошибка изменения аватара: ${response.reasonPhrase}';
      }
    } catch (e) {
      return 'Произошла ошибка при изменении аватара';
    }
  }


  Future<void> logout() async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
  }
}
