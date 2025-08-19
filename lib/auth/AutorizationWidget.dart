import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../ChangePass/resetPasswordWidget.dart';
import '../MethodsConnect/Autorization.dart';
import '../Home/homeWidget.dart';

class Autification extends StatefulWidget {
  @override
  _AutificationState createState() => _AutificationState();
}

class _AutificationState extends State<Autification> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorMessage = '';
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final authBackend = AuthorizationBackend();

    Widget bodyContent = SingleChildScrollView(
      child: Container(
        width: screenWidth,
        height: screenHeight,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.05),
            Container(
              width: screenWidth * 0.9,
              child: Text(
                'Добро пожаловать!\nПожалуйста, введите данные для авторизации',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF1E232C),
                  fontSize: screenWidth * 0.07,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                  height: 1.30,
                  letterSpacing: -0.30,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            _buildPlatformTextField(
              controller: _loginController,
              hintText: 'Введите логин',
              isIOS: isIOS,
              obscureText: false,
            ),
            SizedBox(height: screenHeight * 0.02),
            _buildPlatformTextField(
              controller: _passwordController,
              hintText: 'Введите пароль',
              isIOS: isIOS,
              obscureText: _obscurePassword,
              onToggleVisibility: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            SizedBox(height: screenHeight * 0.02),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPassword()),
                );
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Забыли пароль?',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF6A707C),
                    fontSize: screenWidth * 0.035,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            if (errorMessage.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.01),
                child: Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: screenWidth * 0.035,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            SizedBox(height: screenHeight * 0.02),
            _buildPlatformButton(
              onPressed: () async {
                final error = await authBackend.auth(
                  login: _loginController.text,
                  password: _passwordController.text,
                );

                if (context.mounted) {
                  if (error == null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(error),
                      ),
                    );
                  }
                }
              },
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              text: 'Авторизация',
            ),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );

    if (isIOS) {
      return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.white,
        child: bodyContent,
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: bodyContent,
      );
    }
  }

  Widget _buildPlatformTextField({
    required TextEditingController controller,
    required String hintText,
    required bool isIOS,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
  }) {
    if (isIOS) {
      return CupertinoTextField(
        controller: controller,
        placeholder: hintText,
        obscureText: obscureText,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          border: Border.all(
            color: CupertinoColors.lightBackgroundGray,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        suffix: obscureText
            ? CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onToggleVisibility,
          child: Icon(
            _obscurePassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
            color: CupertinoColors.systemGrey,
          ),
        )
            : null,
      );
    } else {
      return TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFE8ECF4)),
          ),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: onToggleVisibility != null
              ? IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: onToggleVisibility,
          )
              : null,
        ),
      );
    }
  }

  Widget _buildPlatformButton({
    required VoidCallback onPressed,
    required double screenWidth,
    required double screenHeight,
    required String text,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1E232C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: Size(screenWidth * 0.9, screenHeight * 0.08),
        padding: EdgeInsets.zero,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: screenWidth * 0.04,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}