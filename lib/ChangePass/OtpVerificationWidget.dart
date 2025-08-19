import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpVerification extends StatefulWidget {

  final String correctOtp;

  const OtpVerification({Key? key, required this.correctOtp}) : super(key: key);

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {

  late List<TextEditingController> _controllers;

  late List<FocusNode> _focusNodes;
  final int _otpLength = 6;
  String _enteredOtp = "";
  String _message = "";
  Color _messageColor = Colors.transparent;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(_otpLength, (index) => TextEditingController());
    _focusNodes = List.generate(_otpLength, (index) => FocusNode());


    for (int i = 0; i < _otpLength; i++) {
      _focusNodes[i].addListener(() {
        setState(() {});
      });
      _controllers[i].addListener(() {
        if (_controllers[i].text.length == 1) {
          if (i < _otpLength - 1) {
            _focusNodes[i + 1].requestFocus();
          }
        }
        _updateEnteredOtp();
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _updateEnteredOtp() {
    setState(() {
      _enteredOtp = _controllers.map((c) => c.text).join();
    });
  }

  void _verifyOtp() {
    print('Полученный код с класса: ${widget.correctOtp}');
    print('Полученный код с текстового поля: $_enteredOtp');
    if (_enteredOtp == widget.correctOtp) {
      setState(() {
        _message = "Код подтвержден успешно! ✅";
        print('Правильный код');
        _messageColor = Colors.green;
      });
    } else {
      setState(() {
        _message = "Неверный код. Попробуйте еще раз. ❌";
        print('Неправильный код');
        _messageColor = Colors.red;
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
          icon: Icon(Icons.arrow_back, color: Color(0xFF1E232C)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Проверка OTP',
              style: TextStyle(
                color: Color(0xFF1E232C),
                fontSize: 30,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Введите код подтверждения, который мы только что отправили на ваш адрес электронной почты.',
              style: TextStyle(
                color: Color(0xFF838BA1),
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(_otpLength, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                  width: 50,
                  height: 60,
                  decoration: BoxDecoration(
                    color: _focusNodes[index].hasFocus ? Colors.white : Color(0xFFF7F8F9),
                    border: Border.all(
                      color: _focusNodes[index].hasFocus ? Color(0xFF34C2C1) : Color(0xFFE8ECF4),
                      width: 1.2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      onChanged: (value) {
                        if (value.isEmpty && index > 0) {
                          _focusNodes[index - 1].requestFocus();
                        }
                      },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      style: TextStyle(
                        color: Color(0xFF1E232C),
                        fontSize: 22,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _verifyOtp,
                child: Text(
                  'Проверить',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1E232C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
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
            Spacer(),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Не получили код? ',
                      style: TextStyle(
                        color: Color(0xFF032426),
                        fontSize: 15,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: 'Отправить повторно',
                      style: TextStyle(
                        color: Color(0xFF34C2C1),
                        fontSize: 15,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}