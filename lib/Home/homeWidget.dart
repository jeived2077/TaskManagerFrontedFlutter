import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../MethodsConnect/Autorization.dart';

import '../MethodsConnect/WriteLineTask.dart';
import '../auth/AutorizationWidget.dart';



enum TaskStatus { current, completed }

enum TaskPriority { high, medium, low }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

enum SortOption { creationDate, deadline, priority }

class HomePageState extends State<HomePage> {
  List<Task> allTasks = [];
  List<Project> projects = [];
  List<Priority> priorities = [];
  int selectedTab = 0;
  int selectedTaskTab = 0;
  bool _isLoading = true;
  bool _hasError = false;
  int _selectedIndex = 0;

  SortOption _currentSortOption = SortOption.creationDate;
  String? _selectedPriorityFilter;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      final TaskClass taskClass = TaskClass(context: context);
      // The type cast here is now valid because both sides refer to the same class.
      final TasksAndProjectsResponse? response = await taskClass
          .getTasksAndProjects();

      if (response != null) {
        setState(() {
          allTasks = response.tasks;
          projects = response.projects;
          priorities = response.priorities;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
      }
    } catch (e) {
      print('Ошибка загрузки данных: $e');
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  void _logout() async {
    final authBackend = AuthorizationBackend();
    await authBackend.logout();

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Autification()),
      (Route<dynamic> route) => false,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Task> _getFilteredAndSortedTasks() {
    List<Task> filteredTasks = List.from(allTasks);

    if (_selectedPriorityFilter != null) {
      filteredTasks = filteredTasks
          .where((task) => task.namePriority == _selectedPriorityFilter)
          .toList();
    }

    filteredTasks.sort((a, b) {
      switch (_currentSortOption) {
        case SortOption.deadline:
          if (a.deadlineAt == null && b.deadlineAt == null) return 0;
          if (a.deadlineAt == null) return 1;
          if (b.deadlineAt == null) return -1;
          return a.deadlineAt!.compareTo(b.deadlineAt!);
        case SortOption.priority:
          return 0;
        case SortOption.creationDate:
        default:
          return b.createdAt.compareTo(a.createdAt);
      }
    });

    return filteredTasks;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double responsiveWidth(double percent) => screenSize.width * percent;
    double responsiveHeight(double percent) => screenSize.height * percent;
    double responsiveFontSize(double percent) {
      return (screenSize.width * percent).clamp(12.0, 24.0);
    }

    bool isMobilePlatform = !kIsWeb && (Platform.isAndroid || Platform.isIOS);

    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (_hasError) {
      return Scaffold(
        body: Center(
          child: TextButton(
            onPressed: _loadData,
            child: const Text('Повторить'),
          ),
        ),
      );
    }

    Widget mainContent = Container(
      color: const Color(0xFFF2F5FF),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(0.05)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: responsiveHeight(0.08)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Привет, Рохан!',
                      style: TextStyle(
                        color: Color(0xFF2E3A59),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Opacity(
                      opacity: 0.54,
                      child: Text(
                        'Хорошего дня.',
                        style: TextStyle(
                          color: Color(0xFF2E3A59),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.logout, color: Color(0xFF2E3A59)),
                  onPressed: _logout,
                ),
              ],
            ),
            SizedBox(height: responsiveHeight(0.04)),
            const Text(
              'Проекты',
              style: TextStyle(
                color: Color(0xFF2E3A59),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: responsiveHeight(0.02)),
            _buildProjectsSection(
              context,
              responsiveWidth,
              responsiveHeight,
              responsiveFontSize,
              isMobilePlatform,
            ),
            SizedBox(height: responsiveHeight(0.04)),
            const Text(
              'Задачи',
              style: TextStyle(
                color: Color(0xFF2E3A59),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: responsiveHeight(0.02)),
            _buildTaskTabs(
              context,
              responsiveWidth,
              responsiveHeight,
              responsiveFontSize,
            ),
            SizedBox(height: responsiveHeight(0.02)),
            _buildFilterBar(context),
            Expanded(
              child: _buildTasksList(
                context,
                responsiveWidth,
                responsiveHeight,
                responsiveFontSize,
              ),
            ),
          ],
        ),
      ),
    );

    if (isMobilePlatform) {
      return Scaffold(
        body: mainContent,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle),
              label: 'Прогресс',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: 'Добавить',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      );
    } else {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onItemTapped,
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Главная'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.check_circle),
                  label: Text('Прогресс'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.add_box),
                  label: Text('Добавить'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text('Профиль'),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: mainContent),
          ],
        ),
      );
    }
  }

  Widget _buildProjectTabs(
    BuildContext context,
    Function responsiveWidth,
    Function responsiveHeight,
    Function responsiveFontSize,
  ) {
    return const SizedBox.shrink();
  }

  Widget _buildProjectsSection(
    BuildContext context,
    Function responsiveWidth,
    Function responsiveHeight,
    Function responsiveFontSize,
    bool isMobilePlatform,
  ) {
    if (projects.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: Text(
            'У вас пока нет проектов.',
            style: TextStyle(color: Color(0xFF8F9BB3), fontSize: 16),
          ),
        ),
      );
    }

    return Container(
      height: responsiveHeight(0.2),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return _buildProjectCard(
            project,
            context,
            responsiveWidth,
            responsiveHeight,
            responsiveFontSize,
            isMobilePlatform,
          );
        },
      ),
    );
  }

  Widget _buildTaskTabs(
    BuildContext context,
    Function responsiveWidth,
    Function responsiveHeight,
    Function responsiveFontSize,
  ) {
    List<String> tabTitles = ['Текущие задачи', 'Завершенные задачи'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(tabTitles.length, (i) {
          bool isSelected = i == selectedTaskTab;
          return GestureDetector(
            onTap: () => setState(() => selectedTaskTab = i),
            child: Container(
              margin: EdgeInsets.only(right: responsiveWidth(0.03)),
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(0.04),
                vertical: responsiveHeight(0.01),
              ),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : const Color(0xFFE5EAFC),
                borderRadius: BorderRadius.circular(responsiveWidth(0.1)),
                boxShadow: isSelected
                    ? [
                        const BoxShadow(
                          color: Color(0x3FE2E2E2),
                          blurRadius: 10,
                          offset: Offset(2, 4),
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: Text(
                  tabTitles[i],
                  style: TextStyle(
                    color: const Color(0xFF2E3A59),
                    fontSize: responsiveFontSize(0.03),
                    fontFamily: 'Poppins',
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildFilterBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: DropdownButton<String?>(
              value: _selectedPriorityFilter,
              hint: const Text('Приоритет'),
              underline: const SizedBox(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPriorityFilter = newValue;
                });
              },
              items: [
                const DropdownMenuItem(value: null, child: Text('Все')),
                ...priorities.map((priority) {
                  return DropdownMenuItem(
                    value: priority.namePriority,
                    child: Text(priority.namePriority),
                  );
                }).toList(),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: DropdownButton<SortOption>(
              value: _currentSortOption,
              underline: const SizedBox(),
              onChanged: (SortOption? newValue) {
                if (newValue != null) {
                  setState(() {
                    _currentSortOption = newValue;
                  });
                }
              },
              items: const [
                DropdownMenuItem(
                  value: SortOption.creationDate,
                  child: Text('По дате'),
                ),
                DropdownMenuItem(
                  value: SortOption.deadline,
                  child: Text('По дедлайну'),
                ),
                DropdownMenuItem(
                  value: SortOption.priority,
                  child: Text('По приоритету'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
    Project project,
    BuildContext context,
    Function responsiveWidth,
    Function responsiveHeight,
    Function responsiveFontSize,
    bool isMobilePlatform,
  ) {
    return Container(
      width: responsiveWidth(0.6),
      margin: EdgeInsets.only(right: responsiveWidth(0.04)),
      padding: EdgeInsets.all(responsiveWidth(0.04)),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4FF),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3FE2E2E2),
            blurRadius: 10,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.nameProject,
            style: TextStyle(
              fontSize: responsiveFontSize(0.04),
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2E3A59),
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: responsiveHeight(0.01)),
          Text(
            'Создан: ${DateFormat('dd.MM.yyyy').format(project.createdAt)}',
            style: TextStyle(
              fontSize: responsiveFontSize(0.03),
              color: const Color(0xFF8F9BB3),
            ),
          ),
          SizedBox(height: responsiveHeight(0.01)),
          Text(
            'Создал: ${project.createdBy}',
            style: TextStyle(
              fontSize: responsiveFontSize(0.03),
              color: const Color(0xFF8F9BB3),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTasksList(
    BuildContext context,
    Function responsiveWidth,
    Function responsiveHeight,
    Function responsiveFontSize,
  ) {
    final tasksToDisplay = _getFilteredAndSortedTasks();

    if (tasksToDisplay.isEmpty) {
      return const Center(
        child: Text(
          'Задач с такими параметрами нет.',
          style: TextStyle(color: Color(0xFF8F9BB3), fontSize: 16),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: tasksToDisplay.length,
        itemBuilder: (context, index) {
          final task = tasksToDisplay[index];
          final deadlineText = task.deadlineAt != null
              ? DateFormat('dd.MM.yyyy').format(task.deadlineAt!)
              : 'Нет';

          Color priorityColor;
          switch (task.namePriority.toLowerCase()) {
            case 'высокий':
              priorityColor = Colors.red.shade400;
              break;
            case 'средний':
              priorityColor = Colors.orange.shade400;
              break;
            case 'низкий':
              priorityColor = Colors.green.shade400;
              break;
            default:
              priorityColor = Colors.grey;
              break;
          }

          return Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(vertical: responsiveHeight(0.01)),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: priorityColor, width: 2),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              title: Text(
                task.nameTask,
                style: TextStyle(
                  fontSize: responsiveFontSize(0.035),
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'Дедлайн: $deadlineText',
                style: TextStyle(fontSize: responsiveFontSize(0.03)),
              ),
              trailing: Icon(Icons.circle, color: priorityColor, size: 12),
              onTap: () => print('Нажата задача ${task.nameTask}'),
            ),
          );
        },
      );
    }
  }
}
