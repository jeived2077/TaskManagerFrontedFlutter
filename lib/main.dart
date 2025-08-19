import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_manager/Home/homeWidget.dart';

import 'auth/AutorizationWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _homeWidget = Container();

  @override
  void initState() {
    super.initState();
    _checkJwtToken();
  }

  Future<void> _checkJwtToken() async {
    final storage = FlutterSecureStorage();
    String? jwt = await storage.read(key: 'jwt');

    if (jwt == null || jwt.isEmpty) {
      setState(() {
        _homeWidget = Autorization();
      });
    } else {
      setState(() {
        _homeWidget = HomePage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Пример главной страницы',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _homeWidget, // Используем виджет, который определили в _checkJwtToken
    );
  }
}



















class Autorization extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: 159,
            height: 184,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://placehold.co/159x184"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            'Платформа для управление задачами проектов',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF24252C),
              fontSize: 24,
              fontFamily: 'Lexend Deca',
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Этот платформа предназначена для управлением задачи связанным с проектом!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF6E6A7C),
              fontSize: 14,
              fontFamily: 'Lexend Deca',
              fontWeight: FontWeight.w400,
            ),
          ),
          ElevatedButton(
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Autification()),
              );

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E232C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: const Size(331, 56),
              padding: EdgeInsets.zero,
            ),
            child: const Text(
              'Авторизация',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            child: Text(
              'Забыли пароль?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF34C2C1),
                fontSize: 15,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

