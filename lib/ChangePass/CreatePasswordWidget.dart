import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateNewPassword extends StatelessWidget {
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
                top: 419,
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
                left: 135,
                top: 438,
                child: Text(
                  'Reset Password',
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
                left: 22,
                top: 325,
                child: Container(
                  width: 331,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF6F7F8),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFFE8ECF4),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 343,
                child: Text(
                  'Confirm Password',
                  style: TextStyle(
                    color: const Color(0xFF8390A1),
                    fontSize: 15,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                  ),
                ),
              ),
              Positioned(
                left: 22,
                top: 254,
                child: Container(
                  width: 331,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF6F7F8),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFFE8ECF4),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 272,
                child: Text(
                  'New Password',
                  style: TextStyle(
                    color: const Color(0xFF8390A1),
                    fontSize: 15,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                  ),
                ),
              ),
              Positioned(
                left: 22,
                top: 125,
                child: Text(
                  'Create new password',
                  style: TextStyle(
                    color: const Color(0xFF1E232C),
                    fontSize: 30,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                    height: 1.30,
                    letterSpacing: -0.30,
                  ),
                ),
              ),
              Positioned(
                left: 22,
                top: 174,
                child: SizedBox(
                  width: 331,
                  child: Text(
                    'Your new password must be unique from those previously used.',
                    style: TextStyle(
                      color: const Color(0xFF8390A1),
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      height: 1.50,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 22,
                top: 56,
                child: Container(
                  width: 41,
                  height: 41,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFFE8ECF4),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 32,
                top: 67,
                child: Container(
                  width: 19,
                  height: 19,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 375,
                  height: 44,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 20,
                        top: 12,
                        child: Container(
                          width: 54,
                          height: 21,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: Stack(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}