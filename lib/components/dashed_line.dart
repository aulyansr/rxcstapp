import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final double dashWidth;
  final double dashSpace;
  final double height;

  const DashedLine(
      {this.dashWidth = 5.0, this.dashSpace = 5.0, this.height = 1.0});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedLinePainter(
          dashWidth: dashWidth, dashSpace: dashSpace, height: height),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final double height;

  DashedLinePainter(
      {required this.dashWidth, required this.dashSpace, required this.height});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = height;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
