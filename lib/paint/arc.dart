import 'package:flutter/material.dart';
import 'dart:math';

class Arc extends CustomPainter {
  double endValue;
  double width;
  double height;
  Arc({required this.endValue, required this.width, required this.height});
  @override
  void paint(Canvas canvas, Size size) {
    final paintBrush = Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawArc(
      Rect.fromCenter(center: const Offset(0, 0), width: width, height: height),
      3 * pi / 2,
      endValue,
      false,
      paintBrush,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
