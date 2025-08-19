import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordChanged extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 812,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 22,
                top: 508,
                child: Container(
                  width: 331,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1E232C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              Positioned(
                left: 143,
                top: 527,
                child: Text(
                  'Back to Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 75,
                top: 422,
                child: SizedBox(
                  width: 226,
                  child: Text(
                    'Your password has been changed successfully.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF8390A1),
                      fontSize: 15,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      height: 1.50,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 72,
                top: 383,
                child: Text(
                  'Password Changed!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF1E232C),
                    fontSize: 26,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                left: 138,
                top: 248,
                child: Container(
                  width: 100,
                  height: 100,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}