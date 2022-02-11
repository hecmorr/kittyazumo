import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Colors.blue.shade700;
    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();
    //Starts paint from 20% height to the left
    ovalPath.moveTo(0, height * 0.2);
    //paint a curve from current position to middle of the screen
    ovalPath.quadraticBezierTo(
        width * 0.45, height * 0.25, width * 0.5, height * 0.5);
    //paint a curve from current position to bottom left of screen at width * 0.1
    ovalPath.quadraticBezierTo(width * 0.58, height * 0.7, width * 0.1, height);
    paint.color = Colors.blue.shade300;
    canvas.drawPath(ovalPath, paint);
    ovalPath.lineTo(0, height);
    //Close line to reset it back
    ovalPath.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw oldDelegate != this;
  }
}
