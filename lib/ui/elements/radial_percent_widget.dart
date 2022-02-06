// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'dart:math';

import 'package:flutter/material.dart';

class RadialPercentWidget extends StatelessWidget {
  final Widget child;

  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  const RadialPercentWidget(
      {Key? key,
      required this.child,
      required this.percent,
      required this.fillColor,
      required this.lineColor,
      required this.freeColor,
      required this.lineWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MyPainter(
            fillColor: fillColor,
            freeColor: freeColor,
            lineColor: lineColor,
            lineWidth: lineWidth,
            percent: percent,
          ),
        ),
        Center(
          child: child,
        )
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  // final double percent = 0.72;

  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  MyPainter(
      {required this.percent,
      required this.fillColor,
      required this.lineColor,
      required this.freeColor,
      required this.lineWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calculateArcsRect(size);

    drawBackground(canvas, size);

    drawFreeArc(canvas, arcRect);

    drawFilledArc(canvas, arcRect);
  }

  void drawFilledArc(Canvas canvas, Rect arcRect) {
    final feelPain = Paint();
    feelPain.color = lineColor;
    feelPain.style = PaintingStyle.stroke;
    feelPain.strokeWidth = lineWidth;
    feelPain.strokeCap = StrokeCap.round;
    canvas.drawArc(
      arcRect,
      -pi / 2,
      pi * 2 * percent,
      false,
      feelPain,
    );
  }

  void drawFreeArc(Canvas canvas, Rect arcRect) {
    final freePain = Paint();
    freePain.color = freeColor;
    freePain.style = PaintingStyle.stroke;
    freePain.strokeWidth = lineWidth;
    canvas.drawArc(
      arcRect,
      pi * 2 * percent - pi / 2,
      pi * 2 * (1.0 - percent),
      false,
      freePain,
    );
  }

  void drawBackground(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = fillColor;
    paint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, paint);
  }

  Rect calculateArcsRect(Size size) {
    final linesMargin = 3;
    final offset = lineWidth / 2 + linesMargin;
    final arcRect = Offset(offset, offset) &
        Size(size.width - offset * 2, size.height - offset * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
