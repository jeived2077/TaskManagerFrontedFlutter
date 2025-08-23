import 'package:flutter/material.dart';

import 'ClassChangePassword.dart';

class CreateNewPassword extends StatefulWidget {
  final String email_send;

  const CreateNewPassword({Key? key, required this.email_send})
    : super(key: key);

  @override
  _CreateNewPasswordState createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String _message = '';
  Color _messageColor = Colors.transparent;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _resetPassword() async {
    // Add 'async' here
    setState(() {
      _message = '';
      _messageColor = Colors.transparent;
    });

    if (_newPasswordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      setState(() {
        _message = "Пожалуйста, заполните все поля.";
        _messageColor = Colors.red;
      });
      return;
    }

    if (_newPasswordController.text != _confirmPasswordController.text) {
      setState(() {
        _message = "Пароли не совпадают. Попробуйте еще раз.";
        _messageColor = Colors.red;
      });
      return;
    }

    // You need to make the setState call asynchronous to handle the await
    ChangePassword changePassword = ChangePassword(
      context: context,
      email_send: widget.email_send.toString().trim(),
      password: _newPasswordController.text,
    );
    String? code = await changePassword.send_email_code();

    if (code == null || !code.isEmpty) {
      setState(() {
        _message = "Ошибка изменения пароля: $code";
        _messageColor = Colors.red;
      });
    } else {
      setState(() {
        _message =
            "Пароль успешно изменен."; // Or whatever the success message should be
        _messageColor = Colors.green;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E232C)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Создать новый пароль',
              style: TextStyle(
                color: Color(0xFF1E232C),
                fontSize: 30,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ваш новый пароль должен отличаться от тех, что использовались ранее.',
              style: TextStyle(
                color: Color(0xFF838BA1),
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 40),
            // Поле для нового пароля
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Новый пароль',
                hintStyle: const TextStyle(
                  color: Color(0xFF8390A1),
                  fontFamily: 'Urbanist',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                fillColor: const Color(0xFFF7F8F9),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFE8ECF4),
                    width: 1.2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFE8ECF4),
                    width: 1.2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFF34C2C1), // Активный цвет
                    width: 1.2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Поле для подтверждения пароля
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Подтвердите пароль',
                hintStyle: const TextStyle(
                  color: Color(0xFF8390A1),
                  fontFamily: 'Urbanist',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                fillColor: const Color(0xFFF7F8F9),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFE8ECF4),
                    width: 1.2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFE8ECF4),
                    width: 1.2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFF34C2C1), // Активный цвет
                    width: 1.2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 16,
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Кнопка сброса пароля
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _resetPassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E232C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Сбросить пароль',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                _message,
                style: TextStyle(
                  color: _messageColor,
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
