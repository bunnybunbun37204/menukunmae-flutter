import 'package:flutter/material.dart';

class MakeCircle extends CustomPainter {
  final double strokeWidth;
  final StrokeCap strokeCap;
  final double radius;

  MakeCircle(
      {this.strokeCap = StrokeCap.square,
      this.strokeWidth = 10.0,
      this.radius = 10.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = RadialGradient(
              colors: <Color>[Colors.red[700]!, Colors.orange])
          .createShader(
              Rect.fromCircle(center: const Offset(165.0, 55.0), radius: 180.0))
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke; //important set stroke style

    // final path = Path()
    //   ..moveTo(strokeWidth, strokeWidth)
    //   ..arcToPoint(Offset(size.width - strokeWidth, size.height - strokeWidth),
    //       radius: Radius.circular(math.max(size.width, size.height)));

    canvas.drawCircle(Offset(size.width / 2, size.width / 2), radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
