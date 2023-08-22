import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
// size: Size(WIDTH, (WIDTH*1.7790697674418605).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
// painter: CustomPaintBG(),
// )

//Copy this CustomPainter code to the Bottom of the File
class CustomPaintBG extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.5694915);
    path_0.cubicTo(
        size.width * 0.1220930,
        size.height * 0.8779661,
        size.width * 0.2813953,
        size.height * 0.9457627,
        size.width * 0.4662791,
        size.height * 0.8830508);
    path_0.cubicTo(
        size.width * 0.6848837,
        size.height * 0.7694915,
        size.width * 0.8208512,
        size.height * 0.7337831,
        size.width,
        size.height * 0.9970237);
    path_0.lineTo(size.width, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
