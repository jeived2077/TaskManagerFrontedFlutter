import 'package:flutter/material.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 30.29,
            top: 628.50,
            child: Container(
              width: 274.22,
              height: 56.25,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.50, -0.17),
                  end: Alignment(0.61, 1.12),
                  colors: [const Color(0xFF9C2CF3), const Color(0xFF3A48F8)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.57),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3FE2E2E2),
                    blurRadius: 13.52,
                    offset: Offset(9.19, 14.06),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 121.32,
            top: 645.81,
            child: SizedBox(
              width: 92.15,
              height: 22.18,
              child: Text(
                'Create Task',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.60,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            left: 284.50,
            top: 32.45,
            child: Container(
              width: 21.04,
              height: 21.82,
              child: Stack(
                children: [
                  Positioned(left: 330.92, top: 658, child: Container(),),
                ],
              ),
            ),
          ),
          Positioned(
            left: 24.34,
            top: 31.37,
            child: Container(
              width: 23.80,
              height: 23.80,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Stack(),
            ),
          ),
          Positioned(
            left: 113.58,
            top: 34.08,
            child: SizedBox(
              width: 91.41,
              height: 19.47,
              child: Text(
                'Create a Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.98,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            left: 28.13,
            top: 81.13,
            child: SizedBox(
              width: 36.78,
              height: 18.39,
              child: Text(
                'Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: 28.67,
            top: 257.46,
            child: SizedBox(
              width: 61.66,
              height: 18.39,
              child: Text(
                'Start Time',
                style: TextStyle(
                  color: const Color(0xFFBFC8E7),
                  fontSize: 12.13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: 150.90,
            top: 257.46,
            child: SizedBox(
              width: 55.17,
              height: 18.39,
              child: Text(
                'End Time',
                style: TextStyle(
                  color: const Color(0xFFBFC8E7),
                  fontSize: 12.13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: 28.12,
            top: 155.77,
            child: SizedBox(
              width: 29.21,
              height: 18.39,
              child: Text(
                'Date',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: 28.12,
            top: 345.08,
            child: SizedBox(
              width: 68.69,
              height: 18.39,
              child: Text(
                'Description',
                style: TextStyle(
                  color: const Color(0xFFBFC8E7),
                  fontSize: 12.13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: 28.67,
            top: 480.30,
            child: SizedBox(
              width: 57.33,
              height: 18.39,
              child: Text(
                'Category',
                style: TextStyle(
                  color: const Color(0xFFBFC8E7),
                  fontSize: 12.13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: 28.12,
            top: 108.18,
            child: SizedBox(
              width: 144.41,
              height: 25.96,
              child: Text(
                'Design Changes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.31,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            left: 28.67,
            top: 284.50,
            child: SizedBox(
              width: 76.26,
              height: 25.96,
              child: Text(
                '01:22 pm',
                style: TextStyle(
                  color: const Color(0xFF2E3A59),
                  fontSize: 17.31,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            left: 143.33,
            top: 284.50,
            child: SizedBox(
              width: 81.67,
              height: 25.96,
              child: Text(
                '03:20 pm',
                style: TextStyle(
                  color: const Color(0xFF2E3A59),
                  fontSize: 17.31,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            left: 28.12,
            top: 182.82,
            child: SizedBox(
              width: 97.36,
              height: 25.96,
              child: Text(
                'Oct 4, 2020',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.31,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            left: 28.12,
            top: 372.12,
            child: SizedBox(
              width: 278.01,
              height: 77.89,
              child: Text(
                'Lorem ipsum dolor sit amet, er adipiscing elit, sed dianummy nibh euismod  dolor sit amet, er adipiscing elit, sed dianummy nibh euismod.',
                style: TextStyle(
                  color: const Color(0xFF2E3A59),
                  fontSize: 12.98,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            left: 28.13,
            top: 513.29,
            child: Container(
              width: 84.38,
              height: 37.86,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.50, -0.17),
                  end: Alignment(0.61, 1.12),
                  colors: [const Color(0xFF9C2CF3), const Color(0xFF3A48F8)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.57),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3FE2E2E2),
                    blurRadius: 13.52,
                    offset: Offset(9.19, 14.06),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 55.17,
            top: 525.73,
            child: SizedBox(
              width: 30.29,
              height: 12.98,
              child: Text(
                'Design',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8.65,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            left: 28.13,
            top: 561.43,
            child: Container(
              width: 84.38,
              height: 37.86,
              decoration: ShapeDecoration(
                color: const Color(0xFFE5EAFC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.57),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3FE2E2E2),
                    blurRadius: 13.52,
                    offset: Offset(9.19, 14.06),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 62.20,
            top: 573.87,
            child: SizedBox(
              width: 16.23,
              height: 12.98,
              child: Text(
                'BDE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF2E3A59),
                  fontSize: 8.65,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: 121.16,
            top: 513.29,
            child: Container(
              width: 84.38,
              height: 37.86,
              decoration: ShapeDecoration(
                color: const Color(0xFFE4EAFB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.57),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3FE2E2E2),
                    blurRadius: 13.52,
                    offset: Offset(9.19, 14.06),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 146.04,
            top: 525.73,
            child: SizedBox(
              width: 35.16,
              height: 12.98,
              child: Text(
                'Meeting',
                style: TextStyle(
                  color: const Color(0xFF2E3A59),
                  fontSize: 8.65,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: 121.16,
            top: 561.43,
            child: Container(
              width: 84.38,
              height: 37.86,
              decoration: ShapeDecoration(
                color: const Color(0xFFE4EAFB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.57),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3FE2E2E2),
                    blurRadius: 13.52,
                    offset: Offset(9.19, 14.06),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 147.66,
            top: 573.87,
            child: SizedBox(
              width: 31.37,
              height: 12.98,
              child: Text(
                'Testing',
                style: TextStyle(
                  color: const Color(0xFF2E3A59),
                  fontSize: 8.65,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: 214.19,
            top: 513.29,
            child: Container(
              width: 84.38,
              height: 37.86,
              decoration: ShapeDecoration(
                color: const Color(0xFFE4EAFB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.57),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3FE2E2E2),
                    blurRadius: 13.52,
                    offset: Offset(9.19, 14.06),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 240.15,
            top: 525.73,
            child: SizedBox(
              width: 31.91,
              height: 12.98,
              child: Text(
                'Coding',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF2E3A59),
                  fontSize: 8.65,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: 214.19,
            top: 561.43,
            child: Container(
              width: 84.38,
              height: 37.86,
              decoration: ShapeDecoration(
                color: const Color(0xFFE4EAFB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.57),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3FE2E2E2),
                    blurRadius: 13.52,
                    offset: Offset(9.19, 14.06),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 235.28,
            top: 573.87,
            child: SizedBox(
              width: 42.19,
              height: 12.98,
              child: Text(
                'Quick call',
                style: TextStyle(
                  color: const Color(0xFF2E3A59),
                  fontSize: 8.65,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: 359.68,
            top: 0,
            child: Container(
              width: 334.53,
              height: 723.64,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFF242736),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.82),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 35.16,
                    top: 666.90,
                    child: Container(
                      width: 24.88,
                      height: 24.88,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(),
                    ),
                  ),
                  Positioned(
                    left: 111.42,
                    top: 663.66,
                    child: Container(
                      width: 31.37,
                      height: 31.37,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(),
                    ),
                  ),
                  Positioned(
                    left: 194.17,
                    top: 665.82,
                    child: Container(
                      width: 27.04,
                      height: 27.04,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 15.69,
                            top: 5.95,
                            child: Container(
                              width: 6.49,
                              height: 6.49,
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.50, -0.17),
                                  end: Alignment(0.61, 1.12),
                                  colors: [const Color(0xFF9C2CF3), const Color(0xFF3A48F8)],
                                ),
                                shape: OvalBorder(
                                  side: BorderSide(
                                    width: 0.54,
                                    color: const Color(0xFFF2F5FF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 272.60,
                    top: 665.28,
                    child: Container(
                      width: 27.64,
                      height: 28.67,
                      child: Stack(
                        children: [
                          Positioned(left: 136.64, top: 16.34, child: Container(),),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: -20.01,
                    child: Container(
                      width: 334.80,
                      height: 267.19,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.82),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x05000000),
                            blurRadius: 12.44,
                            offset: Offset(0, -3.79),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x26643BF6),
                            blurRadius: 23.80,
                            offset: Offset(0, 2.16),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 284.50,
                    top: 32.45,
                    child: Container(
                      width: 21.04,
                      height: 21.82,
                      child: Stack(
                        children: [
                          Positioned(left: 330.92, top: 658, child: Container(),),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24.34,
                    top: 169.39,
                    child: SizedBox(
                      width: 19.82,
                      height: 19.82,
                      child: Text(
                        'Mo',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 12.54,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 70.79,
                    top: 169.39,
                    child: SizedBox(
                      width: 15.42,
                      height: 19.82,
                      child: Text(
                        'Tu',
                        style: TextStyle(
                          color: const Color(0xFF9C2CF3),
                          fontSize: 12.54,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 113.45,
                    top: 169.39,
                    child: SizedBox(
                      width: 22.02,
                      height: 19.82,
                      child: Text(
                        'We',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 12.54,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 159.84,
                    top: 169.39,
                    child: SizedBox(
                      width: 15.42,
                      height: 19.82,
                      child: Text(
                        'Th',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 12.54,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 205.87,
                    top: 169.39,
                    child: SizedBox(
                      width: 13.21,
                      height: 19.82,
                      child: Text(
                        'Fr',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 12.54,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 249.40,
                    top: 169.39,
                    child: SizedBox(
                      width: 17.62,
                      height: 19.82,
                      child: Text(
                        'Sa',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 12.54,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 293.51,
                    top: 169.39,
                    child: SizedBox(
                      width: 17.62,
                      height: 19.82,
                      child: Text(
                        'Su',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 12.54,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 29.61,
                    top: 187.72,
                    child: SizedBox(
                      width: 8.81,
                      height: 19.82,
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 12.54,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 74.15,
                    top: 187.72,
                    child: SizedBox(
                      width: 8.81,
                      height: 19.82,
                      child: Text(
                        '4',
                        style: TextStyle(
                          color: const Color(0xFF9C2CF3),
                          fontSize: 12.54,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 118.68,
                    top: 187.72,
                    child: SizedBox(
                      width: 8.81,
                      height: 19.82,
                      child: Text(
                        '5',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 12.54,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 163.22,
                    top: 187.72,
                    child: SizedBox(
                      width: 8.81,
                      height: 19.82,
                      child: Text(
                        '6',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 12.54,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 207.76,
                    top: 187.72,
                    child: SizedBox(
                      width: 8.81,
                      height: 19.82,
                      child: Text(
                        '7',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 12.54,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 252.30,
                    top: 187.72,
                    child: SizedBox(
                      width: 8.81,
                      height: 19.82,
                      child: Text(
                        '8',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 12.54,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 296.84,
                    top: 187.72,
                    child: SizedBox(
                      width: 8.81,
                      height: 19.82,
                      child: Text(
                        '9',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 12.54,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24.34,
                    top: 82.75,
                    child: SizedBox(
                      width: 117.91,
                      height: 37.32,
                      child: Text(
                        'Oct, 2020',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 24.97,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 213.11,
                    top: 82.75,
                    child: Container(
                      width: 92.49,
                      height: 37.86,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.50, -0.17),
                          end: Alignment(0.61, 1.12),
                          colors: [const Color(0xFF9C2CF3), const Color(0xFF3A48F8)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.57),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3FE2E2E2),
                            blurRadius: 13.52,
                            offset: Offset(9.19, 14.06),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 247.18,
                    top: 95.19,
                    child: SizedBox(
                      width: 41.11,
                      height: 12.98,
                      child: Text(
                        'Add Task',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.65,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 230.41,
                    top: 95.19,
                    child: Container(
                      width: 12.98,
                      height: 12.98,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(),
                    ),
                  ),
                  Positioned(
                    left: 26.50,
                    top: 275.85,
                    child: SizedBox(
                      width: 50.84,
                      height: 25.96,
                      child: Text(
                        'Tasks',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 17.31,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 28.13,
                    top: 321.82,
                    child: Container(
                      width: 280.17,
                      height: 65.99,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.82),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x05000000),
                            blurRadius: 12.44,
                            offset: Offset(0, -3.79),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 91.95,
                    top: 338.05,
                    child: SizedBox(
                      width: 101.68,
                      height: 18.39,
                      child: Text(
                        'Design Changes',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 12.13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 91.95,
                    top: 355.89,
                    child: SizedBox(
                      width: 74.77,
                      height: 13.48,
                      child: Text(
                        '2 Days ago',
                        style: TextStyle(
                          color: const Color(0xFFBFC8E8),
                          fontSize: 8.91,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 286.66,
                    top: 347.24,
                    child: Container(
                      width: 3.79,
                      height: 3.79,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 286.66,
                    top: 353.13,
                    child: Container(
                      width: 3.79,
                      height: 3.79,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 286.66,
                    top: 359.02,
                    child: Container(
                      width: 3.79,
                      height: 3.79,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 28.13,
                    top: 475.43,
                    child: Container(
                      width: 280.17,
                      height: 65.99,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.82),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x05000000),
                            blurRadius: 12.44,
                            offset: Offset(0, -3.79),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 91.95,
                    top: 491.66,
                    child: SizedBox(
                      width: 101.68,
                      height: 18.39,
                      child: Text(
                        'Design Changes',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 12.13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 91.95,
                    top: 509.50,
                    child: SizedBox(
                      width: 74.77,
                      height: 13.48,
                      child: Text(
                        '2 Days ago',
                        style: TextStyle(
                          color: const Color(0xFFBFC8E8),
                          fontSize: 8.91,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 286.66,
                    top: 500.85,
                    child: Container(
                      width: 3.79,
                      height: 3.79,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 286.66,
                    top: 506.74,
                    child: Container(
                      width: 3.79,
                      height: 3.79,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 286.66,
                    top: 512.63,
                    child: Container(
                      width: 3.79,
                      height: 3.79,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 28.13,
                    top: 398.63,
                    child: Container(
                      width: 280.17,
                      height: 65.99,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.82),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x05000000),
                            blurRadius: 12.44,
                            offset: Offset(0, -3.79),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 91.95,
                    top: 414.85,
                    child: SizedBox(
                      width: 101.68,
                      height: 18.39,
                      child: Text(
                        'Design Changes',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 12.13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 91.95,
                    top: 432.70,
                    child: SizedBox(
                      width: 74.77,
                      height: 13.48,
                      child: Text(
                        '2 Days ago',
                        style: TextStyle(
                          color: const Color(0xFFBFC8E8),
                          fontSize: 8.91,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 28.13,
                    top: 552.24,
                    child: Container(
                      width: 280.17,
                      height: 65.99,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.82),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x05000000),
                            blurRadius: 12.44,
                            offset: Offset(0, -3.79),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 91.95,
                    top: 568.46,
                    child: SizedBox(
                      width: 101.68,
                      height: 18.39,
                      child: Text(
                        'Design Changes',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 12.13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 91.95,
                    top: 586.31,
                    child: SizedBox(
                      width: 74.77,
                      height: 13.48,
                      child: Text(
                        '2 Days ago',
                        style: TextStyle(
                          color: const Color(0xFFBFC8E8),
                          fontSize: 8.91,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 287.21,
                    top: 577.66,
                    child: Container(
                      width: 3.79,
                      height: 3.79,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 287.21,
                    top: 583.55,
                    child: Container(
                      width: 3.79,
                      height: 3.79,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 287.21,
                    top: 589.44,
                    child: Container(
                      width: 3.79,
                      height: 3.79,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 287.21,
                    top: 424.05,
                    child: Container(
                      width: 3.79,
                      height: 3.79,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 287.21,
                    top: 429.94,
                    child: Container(
                      width: 3.79,
                      height: 3.79,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 287.21,
                    top: 435.83,
                    child: Container(
                      width: 3.79,
                      height: 3.79,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24.34,
                    top: 31.37,
                    child: Container(
                      width: 23.80,
                      height: 23.80,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 334.26,
              height: 725.32,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFF2F5FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.82),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 98.98,
                    offset: Offset(50.84, 2.16),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 276.39,
                    top: 28.67,
                    child: Container(
                      width: 29.21,
                      height: 28.67,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(),
                    ),
                  ),
                  Positioned(
                    left: 279.63,
                    top: 31.91,
                    child: Container(
                      width: 22.72,
                      height: 22.18,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(),
                    ),
                  ),
                  Positioned(
                    left: 27.02,
                    top: 80.59,
                    child: SizedBox(
                      width: 159.97,
                      height: 37.32,
                      child: Text(
                        'Hello Rohan!',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 24.97,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 27.02,
                    top: 116.83,
                    child: SizedBox(
                      width: 103.22,
                      height: 18.39,
                      child: Opacity(
                        opacity: 0.54,
                        child: Text(
                          'Have a nice day.',
                          style: TextStyle(
                            color: const Color(0xFF2E3A59),
                            fontSize: 12.49,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 27.02,
                    top: 217.94,
                    child: Container(
                      width: 184.29,
                      height: 183.43,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.50, -0.17),
                          end: Alignment(0.61, 1.12),
                          colors: [const Color(0xFF9C2CF3), const Color(0xFF3A48F8)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.82),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 27.02,
                    top: 218.02,
                    child: Container(
                      width: 184.29,
                      height: 183.69,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFEC703C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.82),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x28000000),
                            blurRadius: 12.98,
                            offset: Offset(0, 6.49),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: -52.59,
                    top: 317.04,
                    child: Opacity(
                      opacity: 0.15,
                      child: Container(
                        width: 187.95,
                        height: 225.10,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF2E3A59),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 103.16,
                    top: 76,
                    child: Opacity(
                      opacity: 0.15,
                      child: Container(
                        width: 187.95,
                        height: 225.10,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF2E3A59),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 47.02,
                    top: 286.66,
                    child: SizedBox(
                      width: 147,
                      height: 46.52,
                      child: Text(
                        'Front-End Development',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.85,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 1.30,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 47.02,
                    top: 365.63,
                    child: SizedBox(
                      width: 90.79,
                      height: 16.23,
                      child: Text(
                        'October 4, 2020',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.82,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 84.31,
                    top: 243.42,
                    child: SizedBox(
                      width: 109.71,
                      height: 18.43,
                      child: Text(
                        'Project 1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 224.28,
                    top: 217.94,
                    child: Container(
                      width: 184.29,
                      height: 183.43,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.50, -0.17),
                          end: Alignment(0.61, 1.12),
                          colors: [const Color(0xFF9C2CF3), const Color(0xFF3A48F8)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.82),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 224.28,
                    top: 218.02,
                    child: Container(
                      width: 184.29,
                      height: 183.69,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFEC703C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.82),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x28000000),
                            blurRadius: 12.98,
                            offset: Offset(0, 6.49),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 144.83,
                    top: 317.04,
                    child: Opacity(
                      opacity: 0.30,
                      child: Container(
                        width: 187.95,
                        height: 225.10,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF2E3A59),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 300.58,
                    top: 76,
                    child: Opacity(
                      opacity: 0.30,
                      child: Container(
                        width: 187.95,
                        height: 225.10,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF2E3A59),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 244.28,
                    top: 286.66,
                    child: SizedBox(
                      width: 147,
                      height: 46.52,
                      child: Text(
                        'Back-End Development',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.85,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 1.30,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 244.28,
                    top: 365.63,
                    child: SizedBox(
                      width: 90.79,
                      height: 16.23,
                      child: Text(
                        'October 4, 2020',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.82,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 281.57,
                    top: 243.42,
                    child: SizedBox(
                      width: 109.71,
                      height: 18.43,
                      child: Text(
                        'Project 2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 27.04,
                    top: 162.26,
                    child: Container(
                      width: 84.38,
                      height: 37.86,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.57),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3FE2E2E2),
                            blurRadius: 13.52,
                            offset: Offset(9.19, 14.06),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 50.80,
                    top: 175.11,
                    child: SizedBox(
                      width: 40.53,
                      height: 13.01,
                      child: Text(
                        'My Tasks',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 8.65,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 120.07,
                    top: 162.26,
                    child: Container(
                      width: 84.38,
                      height: 37.86,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFE5EAFC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.57),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3FE2E2E2),
                            blurRadius: 13.52,
                            offset: Offset(9.19, 14.06),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 137.63,
                    top: 175.38,
                    child: SizedBox(
                      width: 55.43,
                      height: 12.72,
                      child: Text(
                        'In-progress',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 8.65,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 213.11,
                    top: 162.26,
                    child: Container(
                      width: 84.38,
                      height: 37.86,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFE5EAFC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.57),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3FE2E2E2),
                            blurRadius: 13.52,
                            offset: Offset(9.19, 14.06),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 230.23,
                    top: 175.11,
                    child: SizedBox(
                      width: 49.18,
                      height: 13.01,
                      child: Text(
                        'Completed',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 8.65,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 27.02,
                    top: 448.88,
                    child: SizedBox(
                      width: 77.28,
                      height: 26.02,
                      child: Text(
                        'Progress',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 17.31,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 146.04,
                    top: 416.48,
                    child: Container(
                      width: 22.72,
                      height: 5.41,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.50, -0.17),
                          end: Alignment(0.61, 1.12),
                          colors: [const Color(0xFF9C2CF3), const Color(0xFF3A48F8)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(42.19),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 173.08,
                    top: 416.48,
                    child: Container(
                      width: 5.41,
                      height: 5.41,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(42.19),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 182.82,
                    top: 416.48,
                    child: Container(
                      width: 5.41,
                      height: 5.41,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(42.19),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 28.67,
                    top: 493.82,
                    child: Container(
                      width: 280.17,
                      height: 65.99,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.82),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x05000000),
                            blurRadius: 12.44,
                            offset: Offset(0, -3.79),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 92.42,
                    top: 511.23,
                    child: SizedBox(
                      width: 101.60,
                      height: 18.43,
                      child: Text(
                        'Design Changes',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 12.13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 92.42,
                    top: 529.11,
                    child: SizedBox(
                      width: 74.71,
                      height: 13.51,
                      child: Text(
                        '2 Days ago',
                        style: TextStyle(
                          color: const Color(0xFFBFC8E8),
                          fontSize: 8.91,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 287.21,
                    top: 519.24,
                    child: Container(
                      width: 3.79,
                      height: 3.79,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 287.21,
                    top: 525.13,
                    child: Container(
                      width: 3.79,
                      height: 3.79,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 287.21,
                    top: 531.02,
                    child: Container(
                      width: 3.79,
                      height: 3.79,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 28.67,
                    top: 570.62,
                    child: Container(
                      width: 280.17,
                      height: 65.99,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.82),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x05000000),
                            blurRadius: 12.44,
                            offset: Offset(0, -3.79),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 92.42,
                    top: 588.21,
                    child: SizedBox(
                      width: 101.60,
                      height: 18.43,
                      child: Text(
                        'Design Changes',
                        style: TextStyle(
                          color: const Color(0xFF2E3A59),
                          fontSize: 12.13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 92.42,
                    top: 606.10,
                    child: SizedBox(
                      width: 74.71,
                      height: 13.51,
                      child: Text(
                        '2 Days ago',
                        style: TextStyle(
                          color: const Color(0xFFBFC8E8),
                          fontSize: 8.91,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 287.21,
                    top: 598.21,
                    child: Container(
                      width: 3.79,
                      height: 3.79,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 287.21,
                    top: 604.10,
                    child: Container(
                      width: 3.79,
                      height: 3.79,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 287.21,
                    top: 609.99,
                    child: Container(
                      width: 3.79,
                      height: 3.79,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD8DEF3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 32.45,
                    top: 664.20,
                    child: Container(
                      width: 30.29,
                      height: 30.29,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(),
                    ),
                  ),
                  Positioned(
                    left: 115.21,
                    top: 666.90,
                    child: Container(
                      width: 24.88,
                      height: 24.88,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(),
                    ),
                  ),
                  Positioned(
                    left: 194.17,
                    top: 665.82,
                    child: Container(
                      width: 27.04,
                      height: 27.04,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(),
                    ),
                  ),
                  Positioned(
                    left: 272.60,
                    top: 665.28,
                    child: Container(
                      width: 27.64,
                      height: 28.67,
                      child: Stack(
                        children: [
                          Positioned(left: 136.64, top: 16.34, child: Container(),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}