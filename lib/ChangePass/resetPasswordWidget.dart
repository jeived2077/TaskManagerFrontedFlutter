import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_manager/ChangePass/send_email.dart' as send_email_code;
import 'dart:io' show Platform;
import '../auth/AutorizationWidget.dart';
import 'package:flutter/widgets.dart';

// 1. Конвертируем в StatefulWidget
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {

    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Забыли пароль?'),
        ),
        child: _buildBody(context),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Autification(),
                ),
              );
            },
          ),
        ),
        body: _buildBody(context),
      );
    }
  }

  Widget _buildBody(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.05),
          const Text(
            'Забыли пароль?',
            style: TextStyle(
              color: Color(0xFF1E232C),
              fontSize: 30,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w700,
              height: 1.30,
              letterSpacing: -0.30,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          const SizedBox(
            width: 331,
            child: Text(
              'Забыли пароль? Введите электронную почту привязанную к учётной записи',
              style: TextStyle(
                color: Color(0xFF8390A1),
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w500,
                height: 1.50,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.05),

          _buildEmailField(context),
          SizedBox(height: screenHeight * 0.04),

          _buildSendCodeButton(context),
          const Spacer(),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Вспомнили пароль',
                  style: TextStyle(
                    color: Color(0xFF032426),
                    fontSize: 15,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                    height: 1.40,
                    letterSpacing: 0.15,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Autification(),
                      ),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFF34C2C1),
                      fontSize: 15,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                      height: 1.40,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
        ],
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoTextField(
        // 3. Связываем контроллер с полем ввода
        controller: _emailController,
        placeholder: 'Введите электронную почту',
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F7F8),
          border: Border.all(color: const Color(0xFFE8ECF4)),
          borderRadius: BorderRadius.circular(8),
        ),
        style: const TextStyle(
          color: Color(0xFF8390A1),
          fontSize: 15,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w500,
        ),
      );
    } else {
      return TextField(
        // 3. Связываем контроллер с полем ввода
        controller: _emailController,
        decoration: InputDecoration(
          hintText: 'Введите электронную почту',
          hintStyle: const TextStyle(
            color: Color(0xFF8390A1),
            fontSize: 15,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: const Color(0xFFF6F7F8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
          ),
        ),
      );
    }
  }

  Widget _buildSendCodeButton(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (Platform.isIOS) {
      return CupertinoButton(
        onPressed: () async {
          print('Обработка клика');
          final email = _emailController.text;
          final emailSender = send_email_code.SendEmail(email, context: context); // Создаем объект
          final error = await emailSender.send_email_code();
        },
        color: const Color(0xFF1E232C),
        borderRadius: BorderRadius.circular(8),
        child: const Text(
          'Send Code',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    } else {
      return SizedBox(
        width: screenWidth,
        child: ElevatedButton(
          onPressed: () async {
            print('Обработка клика');
            final email = _emailController.text;
            final emailSender = send_email_code.SendEmail(email, context: context); // Создаем объект
            final error = await emailSender.send_email_code();
          },

          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1E232C),
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Отправить код',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }
  }
}