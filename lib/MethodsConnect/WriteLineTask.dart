import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../auth/AutorizationWidget.dart';
import 'Autorization.dart';

// --- Классы моделей данных для ответа API ---
class Priority {
  final String namePriority;

  Priority({required this.namePriority});

  factory Priority.fromJson(Map<String, dynamic> json) {
    return Priority(namePriority: json['name_priority'] as String);
  }
}

class Project {
  final int idProject;
  final String nameProject;
  final DateTime createdAt;
  final String createdBy;

  Project({
    required this.idProject,
    required this.nameProject,
    required this.createdAt,
    required this.createdBy,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      idProject: json['Id_Project'] as int,
      nameProject: json['Name_Project'] as String,
      createdAt: DateTime.parse(json['created_At'] as String),
      createdBy: json['created_By'] as String,
    );
  }
}

class Task {
  final int idTask;
  final String nameTask;
  final DateTime? deadlineAt;
  final DateTime createdAt;
  final String createdBy;
  final String namePriority;

  Task({
    required this.idTask,
    required this.nameTask,
    this.deadlineAt,
    required this.createdAt,
    required this.createdBy,
    required this.namePriority,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      idTask: json['Id_Task'] as int,
      nameTask: json['Name_Task'] as String,
      deadlineAt: json['dealine_At'] != null ? DateTime.parse(json['dealine_At'] as String) : null,
      createdAt: DateTime.parse(json['created_At'] as String),
      createdBy: json['created_By'] as String,
      namePriority: json['name_priority'] as String,
    );
  }
}

// --- Класс-контейнер для всего ответа API ---
class TasksAndProjectsResponse {
  final List<Task> tasks;
  final List<Project> projects;
  final List<Priority> priorities;

  TasksAndProjectsResponse({
    required this.tasks,
    required this.projects,
    required this.priorities,
  });
}

class TaskClass {
  final BuildContext context;
  final AuthorizationBackend authBackend = AuthorizationBackend();

  TaskClass({required this.context});

  Future<TasksAndProjectsResponse?> getTasksAndProjects() async {
    try {
      await dotenv.load(fileName: 'env/.env');

      String? jwt = await authBackend.getValidToken();

      if (jwt == null) {
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
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        final List<Task> tasks = (jsonResponse['tasks'] as List)
            .map((json) => Task.fromJson(json as Map<String, dynamic>))
            .toList();

        final List<Project> projects = (jsonResponse['projects'] as List)
            .map((json) => Project.fromJson(json as Map<String, dynamic>))
            .toList();

        final List<Priority> priorities = (jsonResponse['priorities'] as List)
            .map((json) => Priority.fromJson(json as Map<String, dynamic>))
            .toList();

        return TasksAndProjectsResponse(
          tasks: tasks,
          projects: projects,
          priorities: priorities,
        );
      } else if (response.statusCode == 401) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Autification()),
              (Route<dynamic> route) => false,
        );
        return null;
      } else {
        print('Ошибка HTTP-запроса: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Ошибка при выполнении запроса: $e');
      return null;
    }
  }
}