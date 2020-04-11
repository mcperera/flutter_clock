import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as Vector;

class Clock extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    //Global Angel
    var angle = Vector.radians(-90);

    final double r   = sqrt(size.width * size.width + size.height * size.height) / 2;
    final alpha      = atan(size.height / size.width);
    final beta       = alpha + angle;
    final shiftY     = r * sin(beta);
    final shiftX     = r * cos(beta);
    final translateX = size.width / 2 - shiftX;
    final translateY = size.height / 2 - shiftY;

    canvas.translate(translateX, translateY);
    canvas.rotate(angle);

    DateTime now = DateTime.now();

    //inir painter
    final paint     = Paint();
    var center      = Offset(size.width / 2, size.height /2);
    paint.color     = Colors.black;
    canvas.drawCircle(center, (size.width / 3)-8, paint);
    paint.strokeCap = StrokeCap.round;

    // Seconds Line
    final secondsP1 = center;
    double secondsDegree = 360 / 60 * now.second;
    double x = (size.width / 2) + (size.width / 3 -20) * cos(Vector.radians(secondsDegree));
    double y = (size.height / 2) + (size.height / 3 -20) * sin(Vector.radians(secondsDegree));

    final secondsP2 = Offset(x, y);
    paint.color = Colors.cyan;
    paint.strokeWidth = 2;
    canvas.drawLine(secondsP1, secondsP2, paint);

    //Minutes Line
    final minutesP1 = center;
    double minutesDegree = 360 / 60 * now.minute;
    x = (size.width / 2) + (size.width / 3 -30) * cos(Vector.radians(minutesDegree));
    y = (size.height / 2) + (size.height / 3 -30) * sin(Vector.radians(minutesDegree));

    final minutesP2 = Offset(x, y);
    paint.color = Colors.cyan;
    paint.strokeWidth = 3;
    canvas.drawLine(minutesP1, minutesP2, paint);

    //Hour Line
    final hourP1 = center;
    double hourDegree = 360 / 12 * (now.hour - 12);
    x = (size.width / 2) + (size.width / 3 - 60) * cos(Vector.radians(hourDegree));
    y = (size.height / 2) + (size.height / 3 - 60) * sin(Vector.radians(hourDegree));

    final hourP2 = Offset(x, y);
    paint.color = Colors.cyan;
    paint.strokeWidth = 4;
    canvas.drawLine(hourP1, hourP2, paint);

    //External Lines
    for(int i = 0; i < 60; i++){
      //Calculate line position
      double minute = 360 / 60 * i;

      //Set style every 5 minutes
      paint.color = (i % 5 == 0)?Colors.black:Colors.white;
      paint.strokeWidth = (i % 5 == 0)?4:1;

      int distance = (i % 5 == 0)?10:15;

      double x1 = (size.width / 2) + (size.width / 3) * cos(Vector.radians(minute));
      double y1 = (size.height / 2) + (size.width / 3) * sin(Vector.radians(minute));
      final p1 = Offset(x1, y1);

      double x2 = (size.width / 2) + (size.width / 3 + 20) * cos(Vector.radians(minute));
      double y2 = (size.height / 2) + (size.width / 3 + 20) * sin(Vector.radians(minute));
      final p2 = Offset(x2, y2);

      canvas.drawLine(p1, p2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}