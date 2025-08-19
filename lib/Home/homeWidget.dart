import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../auth/AutorizationWidget.dart';
import '../MethodsConnect/Autorization.dart';
import '../MethodsConnect/WriteLineTask.dart';

import '../MethodsConnect/WriteLineTask.dart';



class Task {
  final String title;
  final String date;

  Task(this.title, this.date);

  // Factory to create from JSON (from API response)
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      // Используем task_name из ответа сервера для заголовка
      json['task_name'] ?? 'Untitled',
      // Поскольку в запросе нет поля 'date', используем заглушку
      json['date'] ?? 'Unknown date',
    );
  }
}

class Project {
  final String projectName;
  final String type;
  final String date;

  Project(this.projectName, this.type, this.date);

  // Factory to create from JSON
  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      json['project_name'] ?? 'Untitled Project',
      json['type'] ?? 'Unknown type',
      json['date'] ?? 'Unknown date',
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Task> tasks = [];
  List<Project> projects = [];
  int selectedTab = 0;
  bool _isLoading = true; // Добавляем новую переменную состояния для отслеживания загрузки
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // Устанавливаем isLoading в true в начале загрузки
    setState(() {
      _isLoading = true;
      _hasError = false; // Сбрасываем ошибку перед новой попыткой
    });

    TaskClass taskClass = TaskClass(context: context);
    try {
      final fetchedTasks = await taskClass.writeLineTask();
      if (fetchedTasks != null) {
        setState(() {
          tasks = fetchedTasks;
          // Если список пуст, это не ошибка, просто нет данных
          if (tasks.isEmpty) {
            _hasError = false;
          }
        });
      } else {
        // Если fetchedTasks равен null, это считается ошибкой.
        setState(() {
          _hasError = true;
        });
      }
    } catch (e) {
      print('Error loading data: $e');
      setState(() {
        _hasError = true;
      });
    } finally {
      // Всегда устанавливаем isLoading в false, когда загрузка завершена
      setState(() {
        _isLoading = false;
      });
    }
  }


  /// Метод для выхода из системы.
  void _logout() async {
    final authBackend = AuthorizationBackend();
    await authBackend.logout();
    // Навигация на страницу авторизации, удаляя все предыдущие маршруты.
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Autification()),
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Сначала проверяем состояние загрузки
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Затем проверяем состояние ошибки
    if (_hasError) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Ошибка загрузки данных. Пожалуйста, попробуйте еще раз.'),
              const SizedBox(height: 16),
              TextButton(
                onPressed: _loadData,
                child: const Text('Повторить'),
              ),
            ],
          ),
        ),
      );
    }

    // Если загрузка завершена и нет ошибок, но список пуст
    if (tasks.isEmpty) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('У вас пока нет задач.'),
              const SizedBox(height: 16),
              TextButton(
                onPressed: _loadData,
                child: const Text('Обновить'),
              ),
            ],
          ),
        ),
      );
    }

    // Tabs data
    List<String> tabTitles = ['My Tasks', 'In-progress', 'Completed'];
    List<double> tabLefts = [0.07, 0.3, 0.53];
    List<double> tabTextLefts = [0.125, 0.34, 0.57];
    List<double> tabTextWidths = [0.1, 0.14, 0.12];

    // Build tab widgets dynamically
    List<Widget> tabWidgets = [];
    for (int i = 0; i < tabTitles.length; i++) {
      Color bgColor = (i == selectedTab) ? Colors.white : const Color(0xFFE5EAFC);
      FontWeight fw = (i == selectedTab) ? FontWeight.w600 : FontWeight.w400;
      tabWidgets.add(
        Positioned(
          left: screenSize.width * tabLefts[i],
          top: screenSize.height * 0.2,
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedTab = i;
              });
            },
            child: Container(
              width: screenSize.width * 0.21,
              height: screenSize.height * 0.05,
              decoration: ShapeDecoration(
                color: bgColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenSize.width * 0.1),
                ),
                shadows: [
                  BoxShadow(
                    color: const Color(0x3FE2E2E2),
                    blurRadius: screenSize.width * 0.035,
                    offset: Offset(screenSize.width * 0.024, screenSize.height * 0.017),
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      tabWidgets.add(
        Positioned(
          left: screenSize.width * tabTextLefts[i],
          top: screenSize.height * 0.215,
          child: SizedBox(
            width: screenSize.width * tabTextWidths[i],
            height: screenSize.height * 0.016,
            child: Text(
              tabTitles[i],
              style: TextStyle(
                color: const Color(0xFF2E3A59),
                fontSize: screenSize.width * 0.022,
                fontFamily: 'Poppins',
                fontWeight: fw,
              ),
            ),
          ),
        ),
      );
    }

    // Build project widgets dynamically
    List<Widget> projectWidgets = [];
    double projectTop = screenSize.height * 0.27;
    double projectWidth = screenSize.width * 0.45;
    double projectHeight = screenSize.height * 0.23;
    List<double> projectLefts = [screenSize.width * 0.07, screenSize.width * 0.55];
    for (int i = 0; i < projects.length; i++) {
      Project project = projects[i];
      double left = projectLefts[i];
      double relativeTypeLeft = screenSize.width * 0.05;
      double relativeDateLeft = screenSize.width * 0.05;
      double relativeNameLeft = screenSize.width * 0.14;
      double relativeTypeTop = screenSize.height * 0.08;
      double relativeDateTop = screenSize.height * 0.18;
      double relativeNameTop = screenSize.height * 0.03;
      projectWidgets.add(
        Positioned(
          left: left,
          top: projectTop,
          child: GestureDetector(
            onTap: () {
              print('Tapped ${project.projectName}');
            },
            child: Container(
              width: projectWidth,
              height: projectHeight,
              child: Stack(
                children: [
                  Container(
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(0.50, -0.17),
                        end: Alignment(0.61, 1.12),
                        colors: [Color(0xFF9C2CF3), Color(0xFF3A48F8)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenSize.width * 0.03),
                      ),
                    ),
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      color: const Color(0xFFEC703C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenSize.width * 0.03),
                      ),
                      shadows: [
                        BoxShadow(
                          color: const Color(0x28000000),
                          blurRadius: screenSize.width * 0.035,
                          offset: Offset(0, screenSize.height * 0.008),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: relativeTypeLeft,
                    top: relativeTypeTop,
                    child: SizedBox(
                      width: screenSize.width * 0.36,
                      height: screenSize.height * 0.06,
                      child: Text(
                        project.type,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenSize.width * 0.045,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 1.30,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: relativeDateLeft,
                    top: relativeDateTop,
                    child: SizedBox(
                      width: screenSize.width * 0.22,
                      height: screenSize.height * 0.02,
                      child: Text(
                        project.date,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenSize.width * 0.027,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: relativeNameLeft,
                    top: relativeNameTop,
                    child: SizedBox(
                      width: screenSize.width * 0.27,
                      height: screenSize.height * 0.023,
                      child: Text(
                        project.projectName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenSize.width * 0.03,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    // Build the list of widgets for tasks dynamically
    List<Widget> taskWidgets = [];
    double currentTop = screenSize.height * 0.61;
    double gap = screenSize.height * 0.09;

    for (var task in tasks) {
      double relativeTitleLeft = screenSize.width * 0.16;
      double relativeDateLeft = screenSize.width * 0.16;
      double relativeDotRight = screenSize.width * 0.01;
      double relativeTitleTop = screenSize.height * 0.02;
      double relativeDateTop = screenSize.height * 0.04;
      double relativeDotTop = screenSize.height * 0.03;
      double dotGap = screenSize.height * 0.005;
      taskWidgets.add(
        Positioned(
          left: screenSize.width * 0.07,
          top: currentTop,
          child: GestureDetector(
            onTap: () {
              print('Tapped task ${task.title}');
            },
            child: Container(
              width: screenSize.width * 0.86,
              height: screenSize.height * 0.08,
              child: Stack(
                children: [
                  Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenSize.width * 0.03),
                      ),
                      shadows: [
                        BoxShadow(
                          color: const Color(0x05000000),
                          blurRadius: screenSize.width * 0.032,
                          offset: Offset(0, screenSize.height * -0.005),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: relativeTitleLeft,
                    top: relativeTitleTop,
                    child: SizedBox(
                      width: screenSize.width * 0.5,
                      height: screenSize.height * 0.023,
                      child: Text(
                        task.title,
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: screenSize.width * 0.03,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: relativeDateLeft,
                    top: relativeDateTop,
                    child: SizedBox(
                      width: screenSize.width * 0.5,
                      height: screenSize.height * 0.017,
                      child: Text(
                        task.date,
                        style: TextStyle(
                          color: const Color(0xFFBFC8E8),
                          fontSize: screenSize.width * 0.022,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: screenSize.width * 0.01,
                    top: screenSize.height * 0.03,
                    child: Container(
                      width: screenSize.width * 0.01,
                      height: screenSize.height * 0.005,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    right: screenSize.width * 0.01,
                    top: screenSize.height * 0.03 + screenSize.height * 0.005,
                    child: Container(
                      width: screenSize.width * 0.01,
                      height: screenSize.height * 0.005,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    right: screenSize.width * 0.01,
                    top: screenSize.height * 0.03 + 2 * screenSize.height * 0.005,
                    child: Container(
                      width: screenSize.width * 0.01,
                      height: screenSize.height * 0.005,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      currentTop += gap;
    }

    // Bottom navigation widgets dynamically
    List<Widget> bottomWidgets = [];
    List<double> bottomLefts = [0.08, 0.28, 0.48, 0.67];
    List<double> bottomWidths = [0.08, 0.06, 0.07, 0.07];
    List<double> bottomHeights = [0.04, 0.03, 0.033, 0.035];
    for (int i = 0; i < bottomLefts.length; i++) {
      bottomWidgets.add(
        Positioned(
          left: screenSize.width * bottomLefts[i],
          top: screenSize.height * 0.82,
          child: GestureDetector(
            onTap: () {
              print('Tapped bottom icon $i');
            },
            child: Container(
              width: screenSize.width * bottomWidths[i],
              height: screenSize.height * bottomHeights[i],
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: (i == 3)
                  ? Stack(
                children: [
                  Positioned(
                    left: screenSize.width * 0.035,
                    top: screenSize.height * 0.02,
                    child: Container(),
                  ),
                ],
              )
                  : const Stack(),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        width: screenSize.width, // Full screen width
        height: screenSize.height, // Full screen height
        decoration: const ShapeDecoration(
          color: Color(0xFFF2F5FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          shadows: [],
        ),
        child: Stack(
          children: [
            // Top right icons (e.g., notification, profile) with clickability
            Positioned(
              right: screenSize.width * 0.06,
              top: screenSize.height * 0.04,
              child: GestureDetector(
                onTap: () {
                  print('Tapped top icon 1');
                },
                child: Container(
                  width: screenSize.width * 0.08,
                  height: screenSize.height * 0.04,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Stack(),
                ),
              ),
            ),
            Positioned(
              right: screenSize.width * 0.05,
              top: screenSize.height * 0.045,
              child: GestureDetector(
                onTap: () {
                  print('Tapped top icon 2');
                },
                child: Container(
                  width: screenSize.width * 0.06,
                  height: screenSize.height * 0.03,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Stack(),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: screenSize.width,
                height: screenSize.height,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF2F5FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenSize.width * 0.03),
                  ),
                  shadows: [
                    BoxShadow(
                      color: const Color(0x3F000000),
                      blurRadius: screenSize.width * 0.27,
                      offset: Offset(screenSize.width * 0.14, screenSize.height * 0.003),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Inner top right icons (duplicated in original, added clickability)
                    Positioned(
                      right: screenSize.width * 0.06,
                      top: screenSize.height * 0.04,
                      child: GestureDetector(
                        onTap: () {
                          print('Tapped inner top icon 1');
                        },
                        child: Container(
                          width: screenSize.width * 0.08,
                          height: screenSize.height * 0.04,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: const Stack(),
                        ),
                      ),
                    ),
                    Positioned(
                      right: screenSize.width * 0.05,
                      top: screenSize.height * 0.045,
                      child: GestureDetector(
                        onTap: () {
                          print('Tapped inner top icon 2');
                        },
                        child: Container(
                          width: screenSize.width * 0.06,
                          height: screenSize.height * 0.03,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: const Stack(),
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenSize.width * 0.07,
                      top: screenSize.height * 0.1,
                      child: SizedBox(
                        width: screenSize.width * 0.4,
                        height: screenSize.height * 0.05,
                        child: Text(
                          'Hello Rohan!',
                          style: TextStyle(
                            color: const Color(0xFF2E3A59),
                            fontSize: screenSize.width * 0.06,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenSize.width * 0.07,
                      top: screenSize.height * 0.15,
                      child: SizedBox(
                        width: screenSize.width * 0.26,
                        height: screenSize.height * 0.025,
                        child: Opacity(
                          opacity: 0.54,
                          child: Text(
                            'Have a nice day.',
                            style: TextStyle(
                              color: const Color(0xFF2E3A59),
                              fontSize: screenSize.width * 0.03,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: screenSize.width * 0.07,
                      top: screenSize.height * 0.1,
                      child: IconButton(
                        icon: const Icon(Icons.logout, color: Color(0xFF2E3A59)),
                        onPressed: _logout,
                      ),
                    ),
                    // Dynamically added tab widgets
                    ...tabWidgets,
                    // Project decorations (ovals)
                    Positioned(
                      left: screenSize.width * -0.14,
                      top: screenSize.height * 0.39,
                      child: Opacity(
                        opacity: 0.15,
                        child: Container(
                          width: screenSize.width * 0.46,
                          height: screenSize.height * 0.28,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF2E3A59),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenSize.width * 0.26,
                      top: screenSize.height * 0.09,
                      child: Opacity(
                        opacity: 0.15,
                        child: Container(
                          width: screenSize.width * 0.46,
                          height: screenSize.height * 0.28,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF2E3A59),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenSize.width * 0.36,
                      top: screenSize.height * 0.39,
                      child: Opacity(
                        opacity: 0.30,
                        child: Container(
                          width: screenSize.width * 0.46,
                          height: screenSize.height * 0.28,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF2E3A59),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenSize.width * 0.74,
                      top: screenSize.height * 0.09,
                      child: Opacity(
                        opacity: 0.30,
                        child: Container(
                          width: screenSize.width * 0.46,
                          height: screenSize.height * 0.28,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF2E3A59),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),
                    // Dynamically added project widgets
                    ...projectWidgets,
                    Positioned(
                      left: screenSize.width * 0.07,
                      top: screenSize.height * 0.55,
                      child: SizedBox(
                        width: screenSize.width * 0.2,
                        height: screenSize.height * 0.032,
                        child: Text(
                          'Progress',
                          style: TextStyle(
                            color: const Color(0xFF2E3A59),
                            fontSize: screenSize.width * 0.045,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenSize.width * 0.36,
                      top: screenSize.height * 0.51,
                      child: Container(
                        width: screenSize.width * 0.06,
                        height: screenSize.height * 0.007,
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(0.50, -0.17),
                            end: Alignment(0.61, 1.12),
                            colors: [Color(0xFF9C2CF3), Color(0xFF3A48F8)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(screenSize.width * 0.11),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenSize.width * 0.43,
                      top: screenSize.height * 0.51,
                      child: Container(
                        width: screenSize.width * 0.015,
                        height: screenSize.height * 0.007,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFD8DEF3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(screenSize.width * 0.11),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenSize.width * 0.45,
                      top: screenSize.height * 0.51,
                      child: Container(
                        width: screenSize.width * 0.015,
                        height: screenSize.height * 0.007,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFD8DEF3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(screenSize.width * 0.11),
                          ),
                        ),
                      ),
                    ),

                    // Используем ListView.builder, чтобы прокручивать список задач
                    Positioned(
                      left: 0,
                      top: screenSize.height * 0.61,
                      right: 0,
                      bottom: 0,
                      child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (BuildContext context, int index) {
                          final task = tasks[index];
                          double gap = screenSize.height * 0.09;

                          double relativeTitleLeft = screenSize.width * 0.16;
                          double relativeDateLeft = screenSize.width * 0.16;
                          double relativeDotRight = screenSize.width * 0.01;
                          double relativeTitleTop = screenSize.height * 0.02;
                          double relativeDateTop = screenSize.height * 0.04;
                          double relativeDotTop = screenSize.height * 0.03;
                          double dotGap = screenSize.height * 0.005;

                          return Padding(
                            padding: EdgeInsets.only(bottom: gap),
                            child: GestureDetector(
                              onTap: () {
                                print('Tapped task ${task.title}');
                              },
                              child: Container(
                                width: screenSize.width * 0.86,
                                height: screenSize.height * 0.08,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(screenSize.width * 0.03),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: const Color(0x05000000),
                                            blurRadius: screenSize.width * 0.032,
                                            offset: Offset(0, screenSize.height * -0.005),
                                            spreadRadius: 0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      left: relativeTitleLeft,
                                      top: relativeTitleTop,
                                      child: SizedBox(
                                        width: screenSize.width * 0.5,
                                        height: screenSize.height * 0.023,
                                        child: Text(
                                          task.title,
                                          style: TextStyle(
                                            color: const Color(0xFF2E3A59),
                                            fontSize: screenSize.width * 0.03,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: relativeDateLeft,
                                      top: relativeDateTop,
                                      child: SizedBox(
                                        width: screenSize.width * 0.5,
                                        height: screenSize.height * 0.017,
                                        child: Text(
                                          task.date,
                                          style: TextStyle(
                                            color: const Color(0xFFBFC8E8),
                                            fontSize: screenSize.width * 0.022,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: relativeDotRight,
                                      top: relativeDotTop,
                                      child: Container(
                                        width: screenSize.width * 0.01,
                                        height: screenSize.height * 0.005,
                                        decoration: const ShapeDecoration(
                                          color: Color(0xFFD8DEF3),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: relativeDotRight,
                                      top: relativeDotTop + dotGap,
                                      child: Container(
                                        width: screenSize.width * 0.01,
                                        height: screenSize.height * 0.005,
                                        decoration: const ShapeDecoration(
                                          color: Color(0xFFD8DEF3),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: relativeDotRight,
                                      top: relativeDotTop + 2 * dotGap,
                                      child: Container(
                                        width: screenSize.width * 0.01,
                                        height: screenSize.height * 0.005,
                                        decoration: const ShapeDecoration(
                                          color: Color(0xFFD8DEF3),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),


                    ...bottomWidgets,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
